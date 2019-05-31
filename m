Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD60B309A4
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 09:45:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Fc1t6yZKzDqfV
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 17:45:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.145; helo=unicom145.biz-email.net;
 envelope-from=zhuysh@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Fc1M6VtWzDqdp
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 17:45:04 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id WMX39654;
 Fri, 31 May 2019 15:44:54 +0800
Received: from jtjnmail201601.home.langchao.com (10.100.2.1) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Fri, 31 May 2019 15:44:50 +0800
Received: from jtjnmail201601.home.langchao.com ([fe80::1d84:2ff3:ead2:1c78])
 by jtjnmail201601.home.langchao.com ([fe80::1d84:2ff3:ead2:1c78%8])
 with mapi id 15.01.1591.008; Fri, 31 May 2019 15:44:50 +0800
From: =?gb2312?B?U2ltb24gWmh1KNbs06Lk+Ck=?= <zhuysh@inspur.com>
To: Samuel Jiang <chyishian.jiang@gmail.com>
Subject: Re: [IPMI] About LAN interface
Thread-Topic: [IPMI] About LAN interface
Thread-Index: AQHVF0o8ZH4t9azy+kqxX5b23Q2jD6aETU8AgAAHcoA=
Date: Fri, 31 May 2019 07:44:50 +0000
Message-ID: <6F24B29F-8F3E-404E-B19D-044C3F017F2A@inspur.com>
References: <0bf60139f1302379f2ff8355443c0286@sslemail.net>
 <6a7553c7-060b-4318-a710-b903862b47af@Spark>
In-Reply-To: <6a7553c7-060b-4318-a710-b903862b47af@Spark>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.1.52]
Content-Type: multipart/signed;
 boundary="Apple-Mail=_25DF0223-EC2B-497C-89BE-B4509BC827A2";
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--Apple-Mail=_25DF0223-EC2B-497C-89BE-B4509BC827A2
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_DFA98005-60DB-4591-B178-616C1DDF51B3"


--Apple-Mail=_DFA98005-60DB-4591-B178-616C1DDF51B3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=gb2312

Hi Samuel,

	I know lanplus interface is ok.
	My question is that can we support both lan and lanplus =
interface?

Best regards,
Simon

> =D4=DA 2019=C4=EA5=D4=C231=C8=D5=A3=AC15:18=A3=ACSamuel Jiang =
<chyishian.jiang@gmail.com> =D0=B4=B5=C0=A3=BA
>=20
> Hi Simon,
>=20
> try use ipmitool -U root  -P 0penBmc -h <host_ip> -I lanplus mc info
>=20
> Reference <https://github.com/openbmc/openbmc/issues/1570>
>=20
> Thanks,
>=20
> Samuel Jiang
> On May 31, 2019, 8:46 AM +0800, Simon Zhu(=D6=EC=D3=A2=E4=F8) =
<zhuysh@inspur.com>, wrote:
>> Hello,
>>=20
>> Does IPMI support lan interface?
>>=20
>> I used ipmitool through lan interface, but failed:
>>=20
>> ipmitool -I lan -H IP -U root -P 0penBmc mc info
>> Authentication type NONE not supported
>> Error: Unable to establish LAN session
>> Error: Unable to establish IPMI v1.5 / RMCP session
>>=20
>> Can we support LAN interface?
>>=20
>> Best regards,
>>=20
>> Simon


--Apple-Mail=_DFA98005-60DB-4591-B178-616C1DDF51B3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=gb2312

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dgb2312"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Samuel,<div class=3D""><br class=3D""></div><div class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>I know =
lanplus interface is ok.</div><div class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>My =
question is that can we support both lan and lanplus =
interface?</div><div class=3D""><br class=3D""></div><div class=3D"">Best =
regards,</div><div class=3D"">Simon<br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">=D4=DA =
2019=C4=EA5=D4=C231=C8=D5=A3=AC15:18=A3=ACSamuel Jiang &lt;<a =
href=3D"mailto:chyishian.jiang@gmail.com" =
class=3D"">chyishian.jiang@gmail.com</a>&gt; =D0=B4=B5=C0=A3=BA</div><br =
class=3D"Apple-interchange-newline"><div class=3D"">
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><title class=3D""></title>

<div class=3D"">
<div name=3D"messageBodySection" style=3D"font-size: 14px; font-family: =
-apple-system, BlinkMacSystemFont, sans-serif;" class=3D"">
<div dir=3D"auto" class=3D"">Hi Simon,
<div dir=3D"auto" class=3D""><br class=3D""></div>
<div dir=3D"auto" class=3D"">try use ipmitool -U root &nbsp;-P 0penBmc =
-h &lt;host_ip&gt; -I lanplus mc info</div>
<div dir=3D"auto" class=3D""><br class=3D""></div>
<div dir=3D"auto" class=3D""><a =
href=3D"https://github.com/openbmc/openbmc/issues/1570" =
class=3D"">Reference</a></div>
</div>
</div>
<div name=3D"messageSignatureSection" class=3D""><br class=3D"">
<div class=3D"matchFont">Thanks,
<div style=3D"font-size: 14px; font-family: -apple-system, =
BlinkMacSystemFont, sans-serif;" class=3D""><br style=3D"font-size: =
14px; font-family: -apple-system, BlinkMacSystemFont, sans-serif;" =
class=3D""></div>
<div style=3D"font-size: 14px; font-family: -apple-system, =
BlinkMacSystemFont, sans-serif;" class=3D"">Samuel Jiang</div>
</div>
</div>
<div name=3D"messageReplySection" style=3D"font-size: 14px; font-family: =
-apple-system, BlinkMacSystemFont, sans-serif;" class=3D"">On May 31, =
2019, 8:46 AM +0800, Simon Zhu(=D6=EC=D3=A2=E4=F8) &lt;<a =
href=3D"mailto:zhuysh@inspur.com" class=3D"">zhuysh@inspur.com</a>&gt;, =
wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"spark_quote" style=3D"margin: 5px =
5px; padding-left: 10px; border-left: thin solid #1abc9c;">Hello,<br =
class=3D"">
<br class=3D"">
Does IPMI support lan interface?<br class=3D"">
<br class=3D"">
I used ipmitool through lan interface, but failed:<br class=3D"">
<br class=3D"">
ipmitool -I lan -H IP -U root -P 0penBmc mc info<br class=3D"">
Authentication type NONE not supported<br class=3D"">
Error: Unable to establish LAN session<br class=3D"">
Error: Unable to establish IPMI v1.5 / RMCP session<br class=3D"">
<br class=3D"">
Can we support LAN interface?<br class=3D"">
<br class=3D"">
Best regards,<br class=3D"">
<br class=3D"">
Simon</blockquote>
</div>
</div>

</div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_DFA98005-60DB-4591-B178-616C1DDF51B3--

--Apple-Mail=_25DF0223-EC2B-497C-89BE-B4509BC827A2
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
KoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwNTMxMDc0NDUwWjAvBgkq
hkiG9w0BCQQxIgQgHVM4eemYw35YpblNko6rBOx7bZInTgxWZY1SrwDX8J8weAYJKwYBBAGCNxAE
MWswaTBbMRMwEQYKCZImiZPyLGQBGRYDY29tMRgwFgYKCZImiZPyLGQBGRYIbGFuZ2NoYW8xFDAS
BgoJkiaJk/IsZAEZFgRob21lMRQwEgYDVQQDEwtMYW5nQ2hhby1DQQIKaj43aAABAAG3QDB6Bgsq
hkiG9w0BCRACCzFroGkwWzETMBEGCgmSJomT8ixkARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxh
bmdjaGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTEUMBIGA1UEAxMLTGFuZ0NoYW8tQ0ECCmo+N2gA
AQABt0AwDQYJKoZIhvcNAQEBBQAEggEAB2c7OQCBDpw6oTHwJL8jT8aGmCQlSohni8f/JNOK1Q82
dRt7Vr+dDLk9XWWBwC7TUv1dDAV0ZQtqW2hK0gp26RZyYr5nqCeIfX/cZIARH+/XYYqAbnQ/jk7F
087E0LhfekERkHGdCo76GF+UAMVT31WeVXYsedj2eVISJZwnyH5fno/1S3TIATvbZYDyfb+uUXD9
UOxHMh4iKsNLGeodQa6fugqhrHZVKNMso3iZaWPCIlZqWIjUvAvPzE1EZymV7edZjEWQOMn+R4nD
uTBAHUc8HYCdT546xpgqdnIhU0u094Fr09mgH8/mA7JU/wL/yLBwCZ2KIjbDpFdFCCNA7wAAAAAA
AA==

--Apple-Mail=_25DF0223-EC2B-497C-89BE-B4509BC827A2--
