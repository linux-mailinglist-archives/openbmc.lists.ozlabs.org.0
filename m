Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 251074C8D4
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 10:01:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TvRJ3Tc3zDqRx
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 18:01:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.61.248; helo=ssh248.corpemail.net;
 envelope-from=suxiao@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
X-Greylist: delayed 135 seconds by postgrey-1.36 at bilbo;
 Thu, 20 Jun 2019 17:57:54 AEST
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TvLp4wHKzDrC7
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 17:57:54 +1000 (AEST)
Received: from ([60.208.111.195])
 by ssh248.corpemail.net (Antispam) with ASMTP (SSL) id LNX37818
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 15:55:18 +0800
Received: from jtjnmail201608.home.langchao.com (10.100.2.8) by
 jtjnmail201611.home.langchao.com (10.100.2.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Thu, 20 Jun 2019 15:55:14 +0800
Received: from jtjnmail201608.home.langchao.com ([fe80::d834:149d:9ffa:ea88])
 by jtjnmail201608.home.langchao.com ([fe80::d834:149d:9ffa:ea88%2])
 with mapi id 15.01.1591.008; Thu, 20 Jun 2019 15:55:14 +0800
From: =?utf-8?B?Q2FydGVyIFN1KOiLj+WtnSk=?= <suxiao@inspur.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Move away from default password
Thread-Topic: Move away from default password
Thread-Index: AdUnO8JPewLMJ13ARFaZCEPpJN6U4Q==
Date: Thu, 20 Jun 2019 07:55:13 +0000
Message-ID: <ca82e6a6ab5440e3b9f9754a66d5452c@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.1.52]
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=SHA1; boundary="----=_NextPart_000_094E_01D52780.8B406CD0"
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_NextPart_000_094E_01D52780.8B406CD0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable


Having a default password is a security risk, but if per BMC has an =
unique password, it may not very convenient for customer to use.
Customers will change the default password when they install new =
machinery, or they may creat new account and password for BMC to use.


Carter Su


---------- Forwarded message ---------
From: Stewart Smith <stewart@linux.ibm.com>
Date: Tue, Jun 18, 2019 at 6:59 AM
Subject: Re: Move away from default password
To: Adriana Kobylak <anoo@linux.ibm.com>, Joseph Reynolds =
<jrey@linux.ibm.com>
Cc: openbmc <openbmc-bounces+anoo=3Dlinux.ibm.com@lists.ozlabs.org>,
Openbmc <openbmc@lists.ozlabs.org>, Thomaiyar, Richard Marian =
<richard.marian.thomaiyar@linux.intel.com>


Adriana Kobylak <anoo@linux.ibm.com> writes:
>>> 1. Unique password per BMC.
>>> In this approach, there is a way to change the factory default=20
>>> password.  Example flow: assemble the BMC, test it, factory reset,=20
>>> generate unique password (such as `pwgen`), then use a new function=20
>>> =E2=80=9Csave factory default settings=E2=80=9D which would save the =
current setting=20
>>> into a new =E2=80=9Cfactory settings=E2=80=9D flash partition. After =
that, a factory=20
>>> reset would reset to the factory installed password, not to the=20
>>> setting in the source code.
>
> How would this new "factory settings" flash partition be protected=20
> against being modified by an unauthorized or malicious user?

My guess would be it'd be protected the same way that the default =
password is today: not at all. If an attacker can write to flash, the =
only way to reset the box is to dediprog the BMC flash chip.

--
Stewart Smith
OPAL Architect, IBM.

------=_NextPart_000_094E_01D52780.8B406CD0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIMOTCCBOgw
ggPQoAMCAQICEHJZ3dAghQm7TR3WtIciZWowDQYJKoZIhvcNAQEFBQAwWzETMBEGCgmSJomT8ixk
ARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdjaGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTEU
MBIGA1UEAxMLTGFuZ0NoYW8tQ0EwHhcNMDUwMTEyMDcyNTIyWhcNMjQxMTA3MTcyNjM4WjBbMRMw
EQYKCZImiZPyLGQBGRYDY29tMRgwFgYKCZImiZPyLGQBGRYIbGFuZ2NoYW8xFDASBgoJkiaJk/Is
ZAEZFgRob21lMRQwEgYDVQQDEwtMYW5nQ2hhby1DQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAMvRSQUPw6jL6C6jqLQaQW3/yXkiew6X5DFftp11ymCmwpOEKEAHQEsOqiha/Lkj8ORt
6KjfEHc1Z4AYgzXz9YJx0lJGoM27U/o07gu73XKTYTLEbs+MCb9Juq52ptSsRsZHBb0n4AfBjFON
8gzgDmTg9TRyM2yNXDHoA1pSrHYvNT37urklW4XorW5DeMGohxlpOApkhsqlGpS2w7C2ZAR82NCp
+80yCDXraDZ5cCOhQAyZ6qHcWJIloyi8+gwzJi1MqWB91JjE4wicxof9SCyNtdbx2XwKxSL5U0zM
sZQJ+201lvmaqCrPSMcoUdZxWWKM2yYtro7oEiwB/4jpaHsCAwEAAaOCAaYwggGiMBMGCSsGAQQB
gjcUAgQGHgQAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTGbsOi
E24avQY6XrcvNNjg05z7IzCCARUGA1UdHwSCAQwwggEIMIIBBKCCAQCggf2GgbxsZGFwOi8vL0NO
PUxhbmdDaGFvLUNBLENOPWp0am5jYTAxLENOPUNEUCxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNl
cyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPWhvbWUsREM9bGFuZ2NoYW8sREM9Y29t
P2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Q/YmFzZT9vYmplY3RDbGFzcz1jUkxEaXN0cmlidXRp
b25Qb2ludIY8aHR0cDovL2p0am5jYTAxLmhvbWUubGFuZ2NoYW8uY29tL0NlcnRFbnJvbGwvTGFu
Z0NoYW8tQ0EuY3JsMBAGCSsGAQQBgjcVAQQDAgEBMCMGCSsGAQQBgjcVAgQWBBRYQgrth4/MB0pS
3hx7TTpz3BidCDANBgkqhkiG9w0BAQUFAAOCAQEAWjsuzhyiArAxdntQqbkoOaDt/caM2xEA3hWn
gjl4yJeKxxuU0U5KLs7wcaVYantJjeL7jb9r29Aeb5lRzcUHodJgk2xvNYAI0s7ZkmahMSbPIMha
w6sKSiq2bI08u7cyPoW5HxVJz3pEM4IkuLaWmMm/I3BUUQE3rxUdXy7iq2CE7KPNKIf+wDuouDgm
bWItUuIev5toOR37MxpPS02Ci1H2KxOGkMDFAWJawNgzseRaRqEJdgMelpS46KnBaT3uFI/wqG+0
1pMVfldgzOBA9Jaj4AC/AWU+v8Ks6+yX8/14Se7bkRltLqmXI6EGHo6KBiIAP2uGHg7lGzCmR/Ja
dTCCB0kwggYxoAMCAQICCmqv3UcAAQABuGAwDQYJKoZIhvcNAQEFBQAwWzETMBEGCgmSJomT8ixk
ARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdjaGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTEU
MBIGA1UEAxMLTGFuZ0NoYW8tQ0EwHhcNMTQxMjA5MDkyNzU4WhcNMTkxMjA4MDkyNzU4WjCBoDET
MBEGCgmSJomT8ixkARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdjaGFvMRQwEgYKCZImiZPy
LGQBGRYEaG9tZTEVMBMGA1UECwwM5rWq5r2u5L+h5oGvMQ8wDQYDVQQLDAbnlKjmiLcxDzANBgNV
BAMMBuiLj+WtnTEgMB4GCSqGSIb3DQEJARYRc3V4aWFvQGluc3B1ci5jb20wggEiMA0GCSqGSIb3
DQEBAQUAA4IBDwAwggEKAoIBAQCpbUD0W0y6Lg5GB/bXz4rEhZFfa+F0u6hz8Ngadu0KHSUMlZsW
y9RX95a0IOGVqYzxEcyAPc30KUNa0xFn0qGOlDNBQm9KiQfGr52CGJQRlQoQG2ew7oPUPK4BnDpt
NYapuKelJ5v1fnotykKrJM0MQFhj4IeSl1jUgBNHdMLJ4atTj5f81jLcxopTBFOX6DuQYYMwsYRy
O209vUDlbfULUBRF0YQkWipi6Uco7BlUDsj2ODZzknYNzBEPFrlu+30CfM4K3ZE64O2IF5+YvVYN
bmq6NEoFcZlvQA2VYX9Q5JM8cIKV5eadBKcJGhk+gYBA9glBWag9BJBF0PHAw+snAgMBAAGjggPH
MIIDwzALBgNVHQ8EBAMCBaAwPgYJKwYBBAGCNxUHBDEwLwYnKwYBBAGCNxUIgvKpH4SB13qGqZE9
hoD3FYPYj1yBSoairR2G15QsAgFkAgEYMEQGCSqGSIb3DQEJDwQ3MDUwDgYIKoZIhvcNAwICAgCA
MA4GCCqGSIb3DQMEAgIAgDAHBgUrDgMCBzAKBggqhkiG9w0DBzAdBgNVHQ4EFgQUrlqThnV3wKMe
46sD0xnYaGq/LVQwHwYDVR0jBBgwFoAUxm7DohNuGr0GOl63LzTY4NOc+yMwggEVBgNVHR8EggEM
MIIBCDCCAQSgggEAoIH9hoG8bGRhcDovLy9DTj1MYW5nQ2hhby1DQSxDTj1qdGpuY2EwMSxDTj1D
RFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlv
bixEQz1ob21lLERDPWxhbmdjaGFvLERDPWNvbT9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jh
c2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnSGPGh0dHA6Ly9qdGpuY2EwMS5ob21l
LmxhbmdjaGFvLmNvbS9DZXJ0RW5yb2xsL0xhbmdDaGFvLUNBLmNybDCCATAGCCsGAQUFBwEBBIIB
IjCCAR4wgbMGCCsGAQUFBzAChoGmbGRhcDovLy9DTj1MYW5nQ2hhby1DQSxDTj1BSUEsQ049UHVi
bGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1ob21l
LERDPWxhbmdjaGFvLERDPWNvbT9jQUNlcnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlm
aWNhdGlvbkF1dGhvcml0eTBmBggrBgEFBQcwAoZaaHR0cDovL2p0am5jYTAxLmhvbWUubGFuZ2No
YW8uY29tL0NlcnRFbnJvbGwvanRqbmNhMDEuaG9tZS5sYW5nY2hhby5jb21fTGFuZ0NoYW8tQ0Eo
MSkuY3J0MCkGA1UdJQQiMCAGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNwoDBDA1BgkrBgEE
AYI3FQoEKDAmMAoGCCsGAQUFBwMCMAoGCCsGAQUFBwMEMAwGCisGAQQBgjcKAwQwPwYDVR0RBDgw
NqAhBgorBgEEAYI3FAIDoBMMEXN1eGlhb0BpbnNwdXIuY29tgRFzdXhpYW9AaW5zcHVyLmNvbTAN
BgkqhkiG9w0BAQUFAAOCAQEAVD/fSXQevnpNB3dZ7y/3Cn9As9+ujNiIMGCuP2rV29Z2GY5gsJFV
4P5NkinQdE0Adkb2M9Smb6fCjYKZhE25c8LE96QfCWfglCn3mFjGZNUfwwrWFCRaSUyMBsM5soCo
mMi9CYFQ7ADgeNS9t8EhCHlgDqnvpQ2vkVlse1i4TwfCU5yeZ5fI5SFHV162Ob9WjHTb/68cmS2N
11b0Xodm6IoKMml6moyr8DmGmCDgB8c8/uJZHy36FinwOfKcWG4dAnmJB/irl9OmuKrIcaXtQSJk
0voaIEPchLEZFEd6Be/glucWOeprFjySvn7vrMsgAxDQZZ53v2EtQGUk0KylCTGCA30wggN5AgEB
MGkwWzETMBEGCgmSJomT8ixkARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdjaGFvMRQwEgYK
CZImiZPyLGQBGRYEaG9tZTEUMBIGA1UEAxMLTGFuZ0NoYW8tQ0ECCmqv3UcAAQABuGAwCQYFKw4D
AhoFAKCCAekwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwNjIw
MDc1NTEyWjAjBgkqhkiG9w0BCQQxFgQUilkYgd8TyXijZb/pao4IdSBws3wweAYJKwYBBAGCNxAE
MWswaTBbMRMwEQYKCZImiZPyLGQBGRYDY29tMRgwFgYKCZImiZPyLGQBGRYIbGFuZ2NoYW8xFDAS
BgoJkiaJk/IsZAEZFgRob21lMRQwEgYDVQQDEwtMYW5nQ2hhby1DQQIKaq/dRwABAAG4YDB6Bgsq
hkiG9w0BCRACCzFroGkwWzETMBEGCgmSJomT8ixkARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxh
bmdjaGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTEUMBIGA1UEAxMLTGFuZ0NoYW8tQ0ECCmqv3UcA
AQABuGAwgZMGCSqGSIb3DQEJDzGBhTCBgjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAoGCCqG
SIb3DQMHMAsGCWCGSAFlAwQBAjAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4D
AhowCwYJYIZIAWUDBAIDMAsGCWCGSAFlAwQCAjALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAE
ggEAiSSSmBL6nZglaOvhvTAZ9eXQWikkWqrZj4guXWBYw9gUbn6CloRjtlPoe1FG+I3ugU0Feoqj
BEtZKwBshoacJwaUwT9aD8tBmSBCbt+WY57+XudYm8q6DqUe+ZUOsE5QDYN+j2TIV6R26NxTp9AM
7b+ETksoB8rYh2kMAemY7ZAX0njuntJqd2UhI5JzkBYH+z3d3WtV7oPQWzX5PmguxW7kYIkeZDNu
hDUWtJtwVAc2zJQgUR5N0HXjKNa0V4GEmd/NOutJgZtDWfIknlgyoSLuWPCL2yfwaglppi6snuZL
V0NwGfLi1Ep5imiriEXfi0zeUOt/fW+D/r7wKcYefgAAAAAAAA==

------=_NextPart_000_094E_01D52780.8B406CD0--
