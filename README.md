# soapui-mock-service
Mock Services Using SoapUI

## Sample SOAP request and response
Endpoint: http://localhost:8080/demographics

```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:dem="http://example.com/demographics">
    <soapenv:Header/>
    <soapenv:Body>
        <dem:GetCitizenDetailsRequest>
            <CitizenID>12345</CitizenID>
        </dem:GetCitizenDetailsRequest>
    </soapenv:Body>
</soapenv:Envelope>

soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tns="http://example.com/demographics">
<soapenv:Header/>
<soapenv:Body>
<tns:GetCitizenDetailsResponse>
    <FullName>John Doe</FullName>
    <DateOfBirth>1985-07-16</DateOfBirth>
    <Address>123 Main Street, Springfield</Address>
    <PhoneNumber>+1234567890</PhoneNumber>
</tns:GetCitizenDetailsResponse>
</soapenv:Body>
        </soapenv:Envelope>
```

