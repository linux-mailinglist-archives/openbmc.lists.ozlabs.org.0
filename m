Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B655305DF
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 02:46:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FQkV3MS3zDqWF
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 10:46:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.146; helo=unicom146.biz-email.net;
 envelope-from=zhuysh@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FQk61M9TzDqSc
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 10:46:20 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net (Antispam) with ASMTP (SSL) id WFZ88310
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 08:46:10 +0800
Received: from jtjnmail201601.home.langchao.com (10.100.2.1) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Fri, 31 May 2019 08:46:09 +0800
Received: from jtjnmail201601.home.langchao.com ([fe80::1d84:2ff3:ead2:1c78])
 by jtjnmail201601.home.langchao.com ([fe80::1d84:2ff3:ead2:1c78%8])
 with mapi id 15.01.1591.008; Fri, 31 May 2019 08:46:09 +0800
From: =?gb2312?B?U2ltb24gWmh1KNbs06Lk+Ck=?= <zhuysh@inspur.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [IPMI] About LAN interface 
Thread-Topic: [IPMI] About LAN interface 
Thread-Index: AQHVF0o8iEBx741F50K4+WNDcSr2zg==
Date: Fri, 31 May 2019 00:46:09 +0000
Message-ID: <A2251FF4-28A5-4311-9DC7-6DD00306E0C9@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.1.52]
Content-Type: multipart/signed;
 boundary="Apple-Mail=_5CF49BE5-00A5-4AAD-9CE8-7AA8E083346F";
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

--Apple-Mail=_5CF49BE5-00A5-4AAD-9CE8-7AA8E083346F
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Hello,

	Does IPMI support lan interface?

	I used ipmitool through lan interface, but failed:
	
	ipmitool -I lan -H IP -U root -P 0penBmc mc info
	Authentication type NONE not supported
	Error: Unable to establish LAN session
	Error: Unable to establish IPMI v1.5 / RMCP session

	Can we support LAN interface?

Best regards,

Simon
--Apple-Mail=_5CF49BE5-00A5-4AAD-9CE8-7AA8E083346F
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
KoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwNTMxMDA0NjA5WjAvBgkq
hkiG9w0BCQQxIgQgaW2vgn1bw0SCAxUWdDMZL+H+R3IdJ8KLQddjSTh2LmEweAYJKwYBBAGCNxAE
MWswaTBbMRMwEQYKCZImiZPyLGQBGRYDY29tMRgwFgYKCZImiZPyLGQBGRYIbGFuZ2NoYW8xFDAS
BgoJkiaJk/IsZAEZFgRob21lMRQwEgYDVQQDEwtMYW5nQ2hhby1DQQIKaj43aAABAAG3QDB6Bgsq
hkiG9w0BCRACCzFroGkwWzETMBEGCgmSJomT8ixkARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxh
bmdjaGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTEUMBIGA1UEAxMLTGFuZ0NoYW8tQ0ECCmo+N2gA
AQABt0AwDQYJKoZIhvcNAQEBBQAEggEAL7/fJzLppvjP4sJyTe/HYquduuc9WnkR8mrYM8aDMdD6
3ZOB+xhuGjhjZaS4qTf397MjtZ7oL8vpdD1JhJLbhghbaixVBHzoOLSWtsue6KR9emSjvQdCdFyW
eHeRG684IYxBw0Wubbbg+qCQr83ozCmMmPgbyV4s1ifXf3TpYHImQQzQTzHTZLYrEiuu3D3GV5l/
1KSwltAnbgSnWUMiVj3pfoW+OEO73ez2H5269ueWM9WoYNFYpSxN+kupc/PzwhfftUpNkx9u8qxA
K38+xJmMxXTybtSi6SKG46dJDCUd5qnNgEXloxtUdPvkW0Oo3mNx6wLGBevLZ1e+gXN70gAAAAAA
AA==

--Apple-Mail=_5CF49BE5-00A5-4AAD-9CE8-7AA8E083346F--
