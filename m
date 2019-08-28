Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FFC9FCE0
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 10:24:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JJgL0Cm4zDr2F
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 18:24:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.145; helo=unicom145.biz-email.net;
 envelope-from=liuxiwei@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
X-Greylist: delayed 128 seconds by postgrey-1.36 at bilbo;
 Wed, 28 Aug 2019 18:23:25 AEST
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JJfP3YfXzDqRf
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 18:23:24 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id TQW64045
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 16:20:45 +0800
Received: from Jtjnmail201617.home.langchao.com (10.100.2.17) by
 Jtjnmail201616.home.langchao.com (10.100.2.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Aug 2019 16:20:44 +0800
Received: from Jtjnmail201617.home.langchao.com ([fe80::9d00:ecba:c3a3:a9c1])
 by Jtjnmail201617.home.langchao.com ([fe80::9d00:ecba:c3a3:a9c1%5])
 with mapi id 15.01.1713.004; Wed, 28 Aug 2019 16:20:44 +0800
From: =?gb2312?B?R2VvcmdlIExpdSAowfXO/c6wKQ==?= <liuxiwei@inspur.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: BMCWeb changes login password
Thread-Topic: BMCWeb changes login password
Thread-Index: AdVdeQ8nj0y1pZYoQbqETPvwYjozzw==
Date: Wed, 28 Aug 2019 08:20:44 +0000
Message-ID: <47e3e7b710604e45a04d184a47011c48@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.1.52]
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=SHA1; boundary="----=_NextPart_000_0006_01D55DBC.8A1897C0"
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

------=_NextPart_000_0006_01D55DBC.8A1897C0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0007_01D55DBC.8A1897C0"


------=_NextPart_001_0007_01D55DBC.8A1897C0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit

I want to discuss with everyone about the solution to change the login
password.

  In the WEB, When the user needs to change the login password, the current
solution is to directly enter the new password twice to change successfully,
but the old password is not verified. the advantage is that we can use the
new password through this solution if we forget the old password. but for
the security reasons, I think should verifying the old password instead of
directly entering the new password before change login password. 

if everyone have any ideas or experience, please share, thanks!


------=_NextPart_001_0007_01D55DBC.8A1897C0
Content-Type: text/html;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dgb2312"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DZH-CN =
link=3D"#0563C1" vlink=3D"#954F72" =
style=3D'text-justify-trim:punctuation'><div class=3DWordSection1><p =
class=3DMsoNormal style=3D'text-indent:10.5pt'><span lang=3DEN-US>I want =
to discuss with everyone about the solution to change the login =
password.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp; In the WEB, When the user needs to change the login =
password, the current solution is to directly enter the new password =
twice to change successfully, but the old password is not verified. the =
advantage is that we can use the new password through this solution if =
we forget the old password. but for the security reasons, I think should =
verifying the old password instead of directly entering the new password =
before change login password. <o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-indent:10.5pt'><span lang=3DEN-US>if everyone have any =
ideas or experience, please share, =
thanks!<o:p></o:p></span></p></div></body></html>
------=_NextPart_001_0007_01D55DBC.8A1897C0--

------=_NextPart_000_0006_01D55DBC.8A1897C0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKPzCCA6Iw
ggKKoAMCAQICEGPKUixTOHaaTcIS5DrQVuowDQYJKoZIhvcNAQELBQAwWTETMBEGCgmSJomT8ixk
ARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdjaGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTES
MBAGA1UEAxMJSU5TUFVSLUNBMB4XDTE3MDEwOTA5MjgzMFoXDTI3MDEwOTA5MzgyOVowWTETMBEG
CgmSJomT8ixkARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdjaGFvMRQwEgYKCZImiZPyLGQB
GRYEaG9tZTESMBAGA1UEAxMJSU5TUFVSLUNBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAq+Q17xtjJLyp5hgXDie1r4DeNj76VUvbZNSywWU5zhx+e0Lu0kwcZ0T3KncZdgdWyqYvRJMQ
/VVqX3gS4VxtLw3zBrg9kGuD0LfpH0cA2b0ZHpxRh5WapP14flcSh/lnawig29z44wfUEg43yTZO
lOfPKos/Dm6wyrJtaPmD6AF7w4+vFZH0zMYfjQkSN/xGgS3OPBNAB8PTHM2sV+fFmnnlTFpyRg0O
IIA2foALZvjIjNdUfp8kMGSh/ZVMfHqTH4eo+FcZPZ+t9nTaJQz9cSylw36+Ig6FGZHA/Zq+0fYy
VCxR1ZLULGS6wsVep8j075zlSinrVpMadguOcArThwIDAQABo2YwZDATBgkrBgEEAYI3FAIEBh4E
AEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUXlkDprRMWGCRTvYe
taU5pjLBNWowEAYJKwYBBAGCNxUBBAMCAQAwDQYJKoZIhvcNAQELBQADggEBAErE37vtdSu2iYVX
Fvmrg5Ce4Y5NyEyvaTh5rTGt/CeDjuFS5kwYpHVLt3UFYJxLPTlAuBKNBwJuQTDXpnEOkBjTwukC
0VZ402ag3bvF/AQ81FVycKZ6ts8cAzd2GOjRrQylYBwZb/H3iTfEsAf5rD/eYFBNS6a4cJ27OQ3s
Y4N3ZyCXVRlogsH+dXV8Nn68BsHoY76TvgWbaxVsIeprTdSZUzNCscb5rx46q+fnE0FeHK01iiKA
xliHryDoksuCJoHhKYxQTuS82A9r5EGALTdmRxhSLL/kvr2M3n3WZmVL6UulBFsNSKJXuIzTe2+D
mMr5DYcsm0ZfNbDOAVrLPnUwggaVMIIFfaADAgECAhN+AAA/HJlvbaMq2PiSAAAAAD8cMA0GCSqG
SIb3DQEBCwUAMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hh
bzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1DQTAeFw0xODExMTkwMTUy
MTVaFw0yMzExMTgwMTUyMTVaMIGUMRMwEQYKCZImiZPyLGQBGRYDY29tMRgwFgYKCZImiZPyLGQB
GRYIbGFuZ2NoYW8xFDASBgoJkiaJk/IsZAEZFgRob21lMRUwEwYDVQQLDAzmtarmva7kv6Hmga8x
EjAQBgNVBAMMCeWImOmUoeS8nzEiMCAGCSqGSIb3DQEJARYTbGl1eGl3ZWlAaW5zcHVyLmNvbTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANx6e1rKY/NsDyKvHLAWVb1NQCEDjUasOVjY
UJYOYvKv9I9JIBNpIuhhejEUJY4bP6pHwPFiPDuMEvWqUEKwPXKTDKvekUuv1hWk/EArmDppVOoR
A17OKJDw3M1pUwsA/k4FPutJhdd3DQbAjfPEA9LsACi4P34jEVxB8Es48p+VGpERbbZ2DNe3ayu9
DNarUUQv5XNTdaAmCRlDsZryLtxzyfvhbjL4h9lMc3vIDbB0ymVkOAUiC1lCy1kXuDThrB7TXxjg
7JnyxnZOqTJv3VrNSIX6nDvfZp88bwLKE0+hsGl3skdm7pVNrZ+wL33EWZJGg/VB8deJIilAi/XT
96UCAwEAAaOCAxgwggMUMAsGA1UdDwQEAwIFoDA9BgkrBgEEAYI3FQcEMDAuBiYrBgEEAYI3FQiC
8qkfhIHXeoapkT2GgPcVg9iPXIFK/YsmgZSnTQIBZAIBWjBEBgkqhkiG9w0BCQ8ENzA1MA4GCCqG
SIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAIAwBwYFKw4DAgcwCgYIKoZIhvcNAwcwHQYDVR0OBBYE
FPmYdlWo2mBG+pDRCikc9P1d4TIyMB8GA1UdIwQYMBaAFF5ZA6a0TFhgkU72HrWlOaYywTVqMIHR
BgNVHR8EgckwgcYwgcOggcCggb2GgbpsZGFwOi8vL0NOPUlOU1BVUi1DQSxDTj1KVENBMjAxMixD
Tj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJh
dGlvbixEQz1ob21lLERDPWxhbmdjaGFvLERDPWNvbT9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0
P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnQwgcQGCCsGAQUFBwEBBIG3MIG0
MIGxBggrBgEFBQcwAoaBpGxkYXA6Ly8vQ049SU5TUFVSLUNBLENOPUFJQSxDTj1QdWJsaWMlMjBL
ZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPWhvbWUsREM9bGFu
Z2NoYW8sREM9Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1jZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5MCkGA1UdJQQiMCAGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNwoDBDA1Bgkr
BgEEAYI3FQoEKDAmMAoGCCsGAQUFBwMCMAoGCCsGAQUFBwMEMAwGCisGAQQBgjcKAwQwQwYDVR0R
BDwwOqAjBgorBgEEAYI3FAIDoBUME2xpdXhpd2VpQGluc3B1ci5jb22BE2xpdXhpd2VpQGluc3B1
ci5jb20wDQYJKoZIhvcNAQELBQADggEBAHvEHNHF1KIAhq1ZiQBaFnY72vW4eJgnvevxHHH6tPHv
tUQsHSUJUMqSptCiw6vphaJolh3orjOrBDlia/6rRG0x36laeVd/6h0Bv3Yy+05Zl8EtrfL0cP0C
QRbR5Yu2M1AP6Z3S/5ggJqJbMRw2hU3ZkR/8uEZH3O4Z4UEbKPPN5BUyfEInCrRAGiGBHzVTo5FO
10ygW33RqQ0bMwG6/FD/dH8NS5wtSeWoonFSJHhSqA7XB1KfJK1TWoF5UEs8AXH2dv2EF5LmfA21
hLjHcQJPs1TIlGPTgPrLED/LQ+OoEinjcm24JTvTtFB1R6mMlVKGKK2y6RYQGpUdCB8bKFQxggOT
MIIDjwIBATBwMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hh
bzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1DQQITfgAAPxyZb22jKtj4
kgAAAAA/HDAJBgUrDgMCGgUAoIIB+DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3
DQEJBTEPFw0xOTA4MjgwODIwNDJaMCMGCSqGSIb3DQEJBDEWBBRDSVNX0L6cGEti8dtnRnAs0MOa
gTB/BgkrBgEEAYI3EAQxcjBwMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZ
FghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1DQQITfgAA
PxyZb22jKtj4kgAAAAA/HDCBgQYLKoZIhvcNAQkQAgsxcqBwMFkxEzARBgoJkiaJk/IsZAEZFgNj
b20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNV
BAMTCUlOU1BVUi1DQQITfgAAPxyZb22jKtj4kgAAAAA/HDCBkwYJKoZIhvcNAQkPMYGFMIGCMAsG
CWCGSAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJYIZIAWUDBAIC
MAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQDHaTs0gmr6NTrSK8CgkmWm0R5tIegAqlha
LU6iYavuWOZ4tP0c9UdhOANd2ObCCOhBpkTXDzttCLgPKsTSodawC97289JUAW3ByNRLbPNpBUcq
lQ56B8bhUoXvhZ3WL5+EySAAEefrp6F0vPvBotUz/4WutzwN6KaYwnTMqwXPLIwoSFObWXWlkKhS
UrACRHknil8+U6h7l6utK/DvkHxjJWEiPgqv8NFqHjy0lxMNF5mID3aOy8dOix/zOtIsBgPq9GRu
sKQQVX5EKBpVdHwZLujTa6hMC9tl1v4jXfxIGaX0cL95ncNt3j8mFGzwu1C+bFHmnvU8+1+a6wnQ
eOUeAAAAAAAA

------=_NextPart_000_0006_01D55DBC.8A1897C0--
