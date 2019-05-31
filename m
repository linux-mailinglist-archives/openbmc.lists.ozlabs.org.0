Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D3F30609
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 03:01:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FR406qdlzDqWF
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 11:01:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.61.248; helo=ssh248.corpemail.net;
 envelope-from=zhuysh@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FR3c5trLzDqTg
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 11:01:28 +1000 (AEST)
Received: from ([60.208.111.195])
 by ssh248.corpemail.net (Antispam) with ASMTP (SSL) id WGG28518
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 09:01:18 +0800
Received: from jtjnmail201601.home.langchao.com (10.100.2.1) by
 jtjnmail201604.home.langchao.com (10.100.2.4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Fri, 31 May 2019 09:01:16 +0800
Received: from jtjnmail201601.home.langchao.com ([fe80::1d84:2ff3:ead2:1c78])
 by jtjnmail201601.home.langchao.com ([fe80::1d84:2ff3:ead2:1c78%8])
 with mapi id 15.01.1591.008; Fri, 31 May 2019 09:01:16 +0800
From: =?gb2312?B?U2ltb24gWmh1KNbs06Lk+Ck=?= <zhuysh@inspur.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [Questions]Can bmcweb support both ports 80 and 443
Thread-Topic: [Questions]Can bmcweb support both ports 80 and 443
Thread-Index: AQHVF0xZj9HLljGAPk6/7cqU5Uj6MQ==
Date: Fri, 31 May 2019 01:01:15 +0000
Message-ID: <B851B5C7-9CF8-4F8F-81D8-3A0B3C1A231F@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.1.52]
Content-Type: multipart/signed;
 boundary="Apple-Mail=_2F40711C-E802-41DE-B663-5761ECE858DC";
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

--Apple-Mail=_2F40711C-E802-41DE-B663-5761ECE858DC
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_928208F9-F0AE-4E8D-88EF-79C4826B3D7B"


--Apple-Mail=_928208F9-F0AE-4E8D-88EF-79C4826B3D7B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hello,

	Can bmcweb support both ports 80 and 443?
	And then we can use http://IP <http://ip/> or https://IP =
<https://ip/> to visit bmcweb.

Best regards,

Simon=

--Apple-Mail=_928208F9-F0AE-4E8D-88EF-79C4826B3D7B
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html; charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; line-break: after-white-space;" class="">Hello,<div class=""><br class=""></div><div class=""><span class="Apple-tab-span" style="white-space:pre">	</span>Can bmcweb support both ports 80 and 443?</div><div class=""><span class="Apple-tab-span" style="white-space:pre">	</span>And then we can use <a href="http://IP" class="">http://IP</a>&nbsp;or <a href="https://IP" class="">https://IP</a>&nbsp;to visit bmcweb.</div><div class=""><br class=""></div><div class="">Best regards,</div><div class=""><br class=""></div><div class="">Simon</div></body></html>
--Apple-Mail=_928208F9-F0AE-4E8D-88EF-79C4826B3D7B--

--Apple-Mail=_2F40711C-E802-41DE-B663-5761ECE858DC
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
KoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwNTMxMDEwMTE2WjAvBgkq
hkiG9w0BCQQxIgQgemLXBGJabf9Wx4wnI8OavcOuI7j8YdnbkFbGd+6mus0weAYJKwYBBAGCNxAE
MWswaTBbMRMwEQYKCZImiZPyLGQBGRYDY29tMRgwFgYKCZImiZPyLGQBGRYIbGFuZ2NoYW8xFDAS
BgoJkiaJk/IsZAEZFgRob21lMRQwEgYDVQQDEwtMYW5nQ2hhby1DQQIKaj43aAABAAG3QDB6Bgsq
hkiG9w0BCRACCzFroGkwWzETMBEGCgmSJomT8ixkARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxh
bmdjaGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTEUMBIGA1UEAxMLTGFuZ0NoYW8tQ0ECCmo+N2gA
AQABt0AwDQYJKoZIhvcNAQEBBQAEggEAMxmx4CwFeJboBP9eeE5I82O3Paa5NsgDTssuWZSC0RT3
3ABdhvQEp7LIhMhZ3kS98sM3TwFs1yBRLgGPj9x8qoynGwDtkru3eTWew6ilt46GD3BUwJ6PwCWs
87VqkyXFwzpNAnAQCK5Y4EVmVP5RcoldzziaXSUDNcya7e0J1F5LWmVJ0NNK193v35bZLNlYI1By
G73NM+BfWXtDsT9eGu6XlDziw+42L7fffE8dRRZIyd+luercfSyc5QDTvZJA7XN+4uoccT+dk5CE
WaARRvF8B0/XVsl8Cp4Vh9lGJKUn3/wVPp/dxN4KdBGxqJIJbVaIBxUolFggphR3Hs2OXwAAAAAA
AA==

--Apple-Mail=_2F40711C-E802-41DE-B663-5761ECE858DC--
