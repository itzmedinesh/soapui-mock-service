#!/bin/bash

# Define variables
SOAPUI_HOME="/Applications/SoapUI-5.7.2.app/Contents/Resources/app" # Path to SoapUI installation
PROJECT_FILE="soapui-mock-service.xml" # Default project file
MOCK_SERVICE_NAME="" # Default to all services if not specified
PORT="8080" # Default port
LOG_FILE="mock_service.log" # Default log file
ARGS="" # Additional arguments

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --project) PROJECT_FILE="$2"; shift ;;
        --service) MOCK_SERVICE_NAME="$2"; shift ;;
        --port) PORT="$2"; shift ;;
        --log) LOG_FILE="$2"; shift ;;
        --args) ARGS="$2"; shift ;;
        --help)
            echo "Usage: $0 [options]"
            echo "Options:"
            echo "  --project <path>   Path to the SoapUI project file (default: MockServiceProject.xml)"
            echo "  --service <name>   Name of the mock service to run (default: all services)"
            echo "  --port <port>      Port to bind the mock service to (default: configured port)"
            echo "  --log <file>       Path to log file (default: mock_service.log)"
            echo "  --args <args>      Additional arguments to pass to mockservicerunner.sh"
            echo "  --help             Show this help message"
            exit 0
            ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Construct command
CMD="$SOAPUI_HOME/bin/mockservicerunner.sh $PROJECT_FILE"

# Add service name if provided
if [[ -n "$MOCK_SERVICE_NAME" ]]; then
    CMD="$CMD -m \"$MOCK_SERVICE_NAME\""
fi

# Add port if specified
if [[ -n "$PORT" ]]; then
    CMD="$CMD -p $PORT"
fi

# Add additional arguments if provided
if [[ -n "$ARGS" ]]; then
    CMD="$CMD $ARGS"
fi

# Run command and redirect output to the log file
echo "Starting SoapUI Mock Service..."
echo "Command: $CMD"
$CMD > "$LOG_FILE" 2>&1 &

# Output status
if [[ $? -eq 0 ]]; then
    echo "SoapUI Mock Service started successfully. Logs: $LOG_FILE"
else
    echo "Failed to start SoapUI Mock Service. Check logs: $LOG_FILE"
    exit 1
fi
