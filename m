Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E074860D6
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 08:05:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTy6S0YPpz30gk
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 18:05:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inspur.com (client-ip=210.51.61.248; helo=ssh248.corpemail.net;
 envelope-from=maxiaochao@inspur.com; receiver=<UNKNOWN>)
X-Greylist: delayed 129 seconds by postgrey-1.36 at boromir;
 Thu, 06 Jan 2022 18:05:00 AEDT
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTy646b1pz2xDM
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 18:05:00 +1100 (AEDT)
Received: from ([60.208.111.195])
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id AYI00114;
 Thu, 06 Jan 2022 15:02:14 +0800
Received: from jtjnmail201604.home.langchao.com (10.100.2.4) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 15:02:15 +0800
Received: from jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322])
 by jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322%5])
 with mapi id 15.01.2308.020; Thu, 6 Jan 2022 15:02:15 +0800
From: =?utf-8?B?WGlhb2NoYW8gTWEgKOmprOWwj+i2hSk=?= <maxiaochao@inspur.com>
To: "mine260309@gmail.com" <mine260309@gmail.com>
Subject: =?utf-8?B?562U5aSNOiBVcGRhdGUgKG9yIGdlbmVyYXRlKSAvZXRjL2lwbWlfcGFzcyBm?=
 =?utf-8?Q?ile?=
Thread-Topic: Update (or generate) /etc/ipmi_pass file
Thread-Index: AdgCrg4my0csNWtVRYG20ese5zhM7v//rp8A//903oA=
Date: Thu, 6 Jan 2022 07:02:15 +0000
Message-ID: <dbe4f24d42c24b9cbe8992fb982f02ec@inspur.com>
References: <3e6afebf819c4784a4dbacacccb74214@inspur.com>
 <CAARXrtmN1Fu8tWsqVotOwz_xdZkPLdaRPoS831mqRTO4FP6HHg@mail.gmail.com>
In-Reply-To: <CAARXrtmN1Fu8tWsqVotOwz_xdZkPLdaRPoS831mqRTO4FP6HHg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.192.64]
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=SHA1; boundary="----=_NextPart_000_0046_01D8030E.63B5E480"
MIME-Version: 1.0
tUid: 20221061502142698f9e3b2748ba026df8e85a283e890
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

------=_NextPart_000_0046_01D8030E.63B5E480
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Sorry I didn't explain some of the methods I tried  : (

1. I tried the method you mentioned, but failed.
The length of the password I want to set is 5 digits.
I modified the complexity setting via /etc/pam.d/common-password, but =
still cannot set a 5-digit password. (The setting for reducing the =
length requirement failed to take effect)

2. I also tried to temporarily remove pam_cracklib.so in =
/etc/pam.d/common-pasword so that it does not perform complexity =
detection. Failed very directly......

-----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: Lei YU [mailto:mine260309@gmail.com]=20
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2022=E5=B9=B41=E6=9C=886=E6=97=A5 =
14:41
=E6=94=B6=E4=BB=B6=E4=BA=BA: Xiaochao Ma (=E9=A9=AC=E5=B0=8F=E8=B6=85) =
<maxiaochao@inspur.com>
=E6=8A=84=E9=80=81: openbmc@lists.ozlabs.org
=E4=B8=BB=E9=A2=98: Re: Update (or generate) /etc/ipmi_pass file

On Thu, Jan 6, 2022 at 11:39 AM Xiaochao Ma =
(=E9=A9=AC=E5=B0=8F=E8=B6=85) <maxiaochao@inspur.com> wrote:
>
> Hello everyone
>
>
>
> I now want to add a default user to my own machine (I modified=20
> obmc-phosphor-image.bbappend, use the useradd=E2=80=A6 ),
>
> but the new default user cannot use Ipmi. It is because the ipmi_pass =
file is not updated.
>
>   I couldn't find a method/tool to generate ipmi_pass file. So how can =
I generate a new ipmi_pass file?
>

What I do is to use qemu or a real BMC, adjust the ipmi =
username/passwords, and then copy the ipmi_pass out.

------=_NextPart_000_0046_01D8030E.63B5E480
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKRTCCA6Iw
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
mMr5DYcsm0ZfNbDOAVrLPnUwggabMIIFg6ADAgECAhN+AABady6mEgoZsjT0AAAAAFp3MA0GCSqG
SIb3DQEBCwUAMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hh
bzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1DQTAeFw0xOTA0MjQwNzQz
MjNaFw0yNDA0MjIwNzQzMjNaMIGWMRMwEQYKCZImiZPyLGQBGRYDY29tMRgwFgYKCZImiZPyLGQB
GRYIbGFuZ2NoYW8xFDASBgoJkiaJk/IsZAEZFgRob21lMRUwEwYDVQQLDAzmtarmva7kv6Hmga8x
EjAQBgNVBAMMCemprOWwj+i2hTEkMCIGCSqGSIb3DQEJARYVbWF4aWFvY2hhb0BpbnNwdXIuY29t
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArxxzwz7wyqRKj9zkngKWY2QzuntASQpb
M6SqulV/sFmLMW8TIBRht3UppU/fvQsdLFd32/MzAVDf5qBF3krBU4eX8LcADirkqfvP50iFjY1R
SAYBYa1wkyILRVGWpVC/qKMEMumM6cWTlH0GyVtm77qafZmcQ7YveqHeECAIfFnAaZCa8xtEs9+R
9vcSrhAT0i/D3a4bUaOQkKekz48m0gF2rECOUhk249cLbgkOJkI0CDSt/IPeLy5bZJ8ZgrOTmyHa
LCSJS1VDbSlwk9jKcoaB725hrqLz0Sp0baB/gUlAJGNQPy7AKBzk6Uibw+YfXIUM2uyEvw8P+0VY
Pepx7QIDAQABo4IDHDCCAxgwPQYJKwYBBAGCNxUHBDAwLgYmKwYBBAGCNxUIgvKpH4SB13qGqZE9
hoD3FYPYj1yBSv2LJoGUp00CAWQCAVwwKQYDVR0lBCIwIAYIKwYBBQUHAwIGCCsGAQUFBwMEBgor
BgEEAYI3CgMEMAsGA1UdDwQEAwIFoDA1BgkrBgEEAYI3FQoEKDAmMAoGCCsGAQUFBwMCMAoGCCsG
AQUFBwMEMAwGCisGAQQBgjcKAwQwRAYJKoZIhvcNAQkPBDcwNTAOBggqhkiG9w0DAgICAIAwDgYI
KoZIhvcNAwQCAgCAMAcGBSsOAwIHMAoGCCqGSIb3DQMHMB0GA1UdDgQWBBSQmhIT5stHwDWAnskw
M0mlgnF98zAfBgNVHSMEGDAWgBReWQOmtExYYJFO9h61pTmmMsE1ajCB0QYDVR0fBIHJMIHGMIHD
oIHAoIG9hoG6bGRhcDovLy9DTj1JTlNQVVItQ0EsQ049SlRDQTIwMTIsQ049Q0RQLENOPVB1Ymxp
YyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9aG9tZSxE
Qz1sYW5nY2hhbyxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENs
YXNzPWNSTERpc3RyaWJ1dGlvblBvaW50MIHEBggrBgEFBQcBAQSBtzCBtDCBsQYIKwYBBQUHMAKG
gaRsZGFwOi8vL0NOPUlOU1BVUi1DQSxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMs
Q049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1ob21lLERDPWxhbmdjaGFvLERDPWNvbT9j
QUNlcnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTBHBgNV
HREEQDA+oCUGCisGAQQBgjcUAgOgFwwVbWF4aWFvY2hhb0BpbnNwdXIuY29tgRVtYXhpYW9jaGFv
QGluc3B1ci5jb20wDQYJKoZIhvcNAQELBQADggEBAGsWSCGucuJ7y3TgHBxlOjx4SQI21uq4CL6G
qb2ZIkFEyh5txT3tPEtqyq9R1ZQpMzoLviuMOhiBoeiQ9y1qee/K/ymINc5Nybv7X7lo2/tu7RVT
MWrkWgwx+i4uzTcA0S0hJOPZI9ZRCguzdHdRRR/yf4sgzPfApi/gbQIMB+1LqaNDpE9XrGW+JEIo
gxY5CGbOJcCgNYFrWm1RZQ0J55hJCi6gcPot2gTHP4XdTmn7OQEv5IVPGoiiqKD7ypIJHoC3wT3W
16jEnpKztq3AkCrtjTQLky9wGYCIKDKnMVXiGIdWsXYxPXk1/qqTqkSODudN2NfYhIPnwmNwlD1i
cdkxggOTMIIDjwIBATBwMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghs
YW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1DQQITfgAAWncu
phIKGbI09AAAAABadzAJBgUrDgMCGgUAoIIB+DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yMjAxMDYwNzAyMTRaMCMGCSqGSIb3DQEJBDEWBBRafNLvlLH0LN5bVEUL
m66JBIGCwTB/BgkrBgEEAYI3EAQxcjBwMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJ
k/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1D
QQITfgAAWncuphIKGbI09AAAAABadzCBgQYLKoZIhvcNAQkQAgsxcqBwMFkxEzARBgoJkiaJk/Is
ZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUx
EjAQBgNVBAMTCUlOU1BVUi1DQQITfgAAWncuphIKGbI09AAAAABadzCBkwYJKoZIhvcNAQkPMYGF
MIGCMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4G
CCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJYIZI
AWUDBAICMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBKuM+10vGjG7CpZhA1WFM0xe+V
Z7uln0LtK0RMNhB00gY45FZSRPrOnZsnNDH4M3IRY/nGbvtaiDu5dQ11IiI7CeX69E7sF7oiTiTy
3QBqCTkTlslJScS+Aey+OdXa4Zwksen1Ablf6vzVLXE6D5+8xKQjGTXzCwAs5kJYonslyP05mUmT
QZQo3zCNJPnSN3J+d81JQqsLGQdeEcRgRx8ay5M+15tvDcP6svOyyG02gfPOM4fX34RX0ifA+Dt8
72eq00GWRnB++utuaflyPIuOUcJ/ikXvkP+UFzcAH18VWGL71oCusBMEqqCATxMOWDUo1BGz1on3
eOiXfOa77ha4AAAAAAAA

------=_NextPart_000_0046_01D8030E.63B5E480--
