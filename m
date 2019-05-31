Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69073305D8
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 02:35:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FQTm15cHzDqTq
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 10:35:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.146; helo=unicom146.biz-email.net;
 envelope-from=zhuysh@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
X-Greylist: delayed 127 seconds by postgrey-1.36 at bilbo;
 Fri, 31 May 2019 10:28:21 AEST
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FQKK3RDRzDqXW
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 10:28:20 +1000 (AEST)
Received: from ([58.56.96.28])
 by unicom146.biz-email.net (Antispam) with ASMTP (SSL) id WFF16404
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 08:26:04 +0800
Received: from jtjnmail201601.home.langchao.com (10.100.2.1) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Fri, 31 May 2019 08:26:03 +0800
Received: from jtjnmail201601.home.langchao.com ([fe80::1d84:2ff3:ead2:1c78])
 by jtjnmail201601.home.langchao.com ([fe80::1d84:2ff3:ead2:1c78%8])
 with mapi id 15.01.1591.008; Fri, 31 May 2019 08:26:03 +0800
From: =?gb2312?B?U2ltb24gWmh1KNbs06Lk+Ck=?= <zhuysh@inspur.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Questions about changing default username or password
Thread-Topic: Questions about changing default username or password
Thread-Index: AQHVF0duABVahmCLMU2DXyKV7nA01A==
Date: Fri, 31 May 2019 00:26:03 +0000
Message-ID: <FF401BD5-4C8A-4F01-8B6B-3138E4A458DB@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.1.52]
Content-Type: multipart/signed;
 boundary="Apple-Mail=_A0E03F56-0C28-437E-A0CC-AF7183E3E4A7";
 protocol="application/pkcs7-signature"; micalg=sha-256
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

--Apple-Mail=_A0E03F56-0C28-437E-A0CC-AF7183E3E4A7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=gb2312

Hello ,

	I want to change default username and password in =
local.conf.sample.

	But caused an invalid username error.

	I fixed it in the following way in =
/openbmc/openbmc/meta/recipes-extended/shadow/shadow.inc:
	I moved the patch shadow-relaxed-usernames.patch from =
SRC_URI_append_class-target to SRC_URI.
=09

	And If I changed the default username or password, I failed to =
use IPMI through lanplus interface because of authentication failure.=20
	I need to generate my own ipmi_pass and install it to =
/etc/ipmi_pass=A1=A3

	Do these two issues need to be fixed?

Best regards,

Simon=

--Apple-Mail=_A0E03F56-0C28-437E-A0CC-AF7183E3E4A7
Content-Disposition: attachment; filename="smime.p7s"
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCBz8w
ggc7MIIGI6ADAgECAgpqPjdoAAEAAbdAMA0GCSqGSIb3DQEBBQUAMFsxEzARBgoJkiaJk/IsZAEZ
FgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxFDAS
BgNVBAMTC0xhbmdDaGFvLUNBMB4XDTE0MTIwOTA3MjM1MFoXDTE5MTIwODA3MjM1MFowgZIxEzAR
BgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixk
ARkWBGhvbWUxFTATBgNVBAsMDOa1qua9ruS/oeaBrzESMBAGA1UEAwwJ5pyx6Iux5r6NMSAwHgYJ
KoZIhvcNAQkBFhF6aHV5c2hAaW5zcHVyLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBANcl7k0O5Ddj8YZ7jFzneSe7nPVnP6CiFRYhW3ZckZhQ2VUSkkE2TgwxPbydHbR6njQZci3A
soufiilTcWrz5gIexwCUPtpf4rg/CSMXdeOQCLR8rHwPahR1tY6EGgYRQGu1KfT6iGOs/of0+ufY
FfpzxvoGfJ11q19Oro3Lrlf1fuA6FCVXTgLIIGHa5pBcDymFr6sS23qTtTnWXyfkDvpWEtGMKhPl
as7ND5pT0LnjNV9/krBcBxUwlkUb30ZWxZJGqP7L3jq5+PWDjJzMLNWjbSPdF8doV81meVVNUz0y
FB4mK8L0kK/2ePkhW/OuPQqnc928wn53u8oBISTUn4MCAwEAAaOCA8cwggPDMAsGA1UdDwQEAwIF
oDA+BgkrBgEEAYI3FQcEMTAvBicrBgEEAYI3FQiC8qkfhIHXeoapkT2GgPcVg9iPXIFKhqKtHYbX
lCwCAWQCARgwRAYJKoZIhvcNAQkPBDcwNTAOBggqhkiG9w0DAgICAIAwDgYIKoZIhvcNAwQCAgCA
MAcGBSsOAwIHMAoGCCqGSIb3DQMHMB0GA1UdDgQWBBRakw7MI3vEw/JZItkKOHzlYEs4HTAfBgNV
HSMEGDAWgBTGbsOiE24avQY6XrcvNNjg05z7IzCCARUGA1UdHwSCAQwwggEIMIIBBKCCAQCggf2G
gbxsZGFwOi8vL0NOPUxhbmdDaGFvLUNBLENOPWp0am5jYTAxLENOPUNEUCxDTj1QdWJsaWMlMjBL
ZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPWhvbWUsREM9bGFu
Z2NoYW8sREM9Y29tP2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Q/YmFzZT9vYmplY3RDbGFzcz1j
UkxEaXN0cmlidXRpb25Qb2ludIY8aHR0cDovL2p0am5jYTAxLmhvbWUubGFuZ2NoYW8uY29tL0Nl
cnRFbnJvbGwvTGFuZ0NoYW8tQ0EuY3JsMIIBMAYIKwYBBQUHAQEEggEiMIIBHjCBswYIKwYBBQUH
MAKGgaZsZGFwOi8vL0NOPUxhbmdDaGFvLUNBLENOPUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2
aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPWhvbWUsREM9bGFuZ2NoYW8sREM9
Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1jZXJ0aWZpY2F0aW9uQXV0aG9yaXR5
MGYGCCsGAQUFBzAChlpodHRwOi8vanRqbmNhMDEuaG9tZS5sYW5nY2hhby5jb20vQ2VydEVucm9s
bC9qdGpuY2EwMS5ob21lLmxhbmdjaGFvLmNvbV9MYW5nQ2hhby1DQSgxKS5jcnQwKQYDVR0lBCIw
IAYIKwYBBQUHAwIGCCsGAQUFBwMEBgorBgEEAYI3CgMEMDUGCSsGAQQBgjcVCgQoMCYwCgYIKwYB
BQUHAwIwCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDBDA/BgNVHREEODA2oCEGCisGAQQBgjcUAgOg
EwwRemh1eXNoQGluc3B1ci5jb22BEXpodXlzaEBpbnNwdXIuY29tMA0GCSqGSIb3DQEBBQUAA4IB
AQBuOubBOCkBWe+svIPrF5VWulW0HevKWzd4xg5Q1Y0h+2sQogGK1wxuKJSWC4aW8N9z6wFRHL9+
ULXrSPpY6VRv89ZLUrGiVt1kfx1hkKvfXcgqtoMRRbSBIegY3mNWgJa/4q1nKAAF8a5enoRotbT3
3VIowB84sDIF++pgixrJ4jjnXbYDhHDhdOWIY/Jt1Drn53hqbIOve0ZZBhfWNE40ag8RzjA6xquZ
zGVC6dGEBVOjYg1heD1i7SsHWYauIGBbzUedq0QPiaotT0m9++X9IRuxjpCS3IJDaNm8jx6U6WH8
XdS6CzYepNoOC2pI5X6LOCooK49ZK7BWpNtEpNSMMYIC9zCCAvMCAQEwaTBbMRMwEQYKCZImiZPy
LGQBGRYDY29tMRgwFgYKCZImiZPyLGQBGRYIbGFuZ2NoYW8xFDASBgoJkiaJk/IsZAEZFgRob21l
MRQwEgYDVQQDEwtMYW5nQ2hhby1DQQIKaj43aAABAAG3QDANBglghkgBZQMEAgEFAKCCAV8wGAYJ
KoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwNTMxMDAyNjAzWjAvBgkq
hkiG9w0BCQQxIgQgDvY6sL7Z+GauHIhlICOnGlU/O+5kgc5GUQPXwIJWQhUweAYJKwYBBAGCNxAE
MWswaTBbMRMwEQYKCZImiZPyLGQBGRYDY29tMRgwFgYKCZImiZPyLGQBGRYIbGFuZ2NoYW8xFDAS
BgoJkiaJk/IsZAEZFgRob21lMRQwEgYDVQQDEwtMYW5nQ2hhby1DQQIKaj43aAABAAG3QDB6Bgsq
hkiG9w0BCRACCzFroGkwWzETMBEGCgmSJomT8ixkARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxh
bmdjaGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTEUMBIGA1UEAxMLTGFuZ0NoYW8tQ0ECCmo+N2gA
AQABt0AwDQYJKoZIhvcNAQEBBQAEggEANa+TQqVI0YxiYDmkEmYc4snZ3nFQ9CpuyEIfVK8SZecI
KBYNUn3gOv+3r/zfqekOJp2MKKnP54W0p6rxmpXAjf8SvIASQ36oShoA5IDotDgqE/4QHZrssMLq
u+MNH+AvbhtPx/haVTAJae9lChwaMd0LPKusdPKJH3nSQA6Eah8U+DCMIO3CINIzmHHBFNP3tpE1
HWguR3/UNgFARdkAD1IqqgWNXGJ62rQEWdpF0ToW+DVhF29ycLQtC4VuvjZSAwpgPb0Tr0ZeK0O3
hBQoGZDIRrtb8d+M3XRdoLjos9IT0XjY3AqO6HMSybvkA2eKm4B49VPy6EIOn8JbrtLyLgAAAAAA
AA==

--Apple-Mail=_A0E03F56-0C28-437E-A0CC-AF7183E3E4A7--
