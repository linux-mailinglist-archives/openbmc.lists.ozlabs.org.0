Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A70A032D7
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 23:43:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRq2n6hwmz3cTp
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 09:43:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.51.26.145
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736144761;
	cv=none; b=RvW+V6yUi4uQyINskVbUGCD0wB3VOAmukVV8G4CGt7kyDAK0gUgtKRrEJf9pgMhCK9pJdzlEjo8FUgrhhwxqTjXiznPZx8meikdAPxKmQTmsMpPhwIcqx6b9tINKXqfrioGSEKHVXFwLOIaxEV5MSix15cbblMfzLUH16wsxXjlsfbbqip8yE4qeRUgz2q5WjOGSMaKqNkXO2jik6QXUhfiyuaPxbFz00DyDyQ+U9cAa0pM+ZUhAxThfvGmE0tSzOh9bn0bO9x2eDzzBbdjbGN89lQxicCyCRgW4t2+QJ4Fwf3VXtQCr0AU3uGrpzMfMf1Nt5W+LBni40OaPGAaAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736144761; c=relaxed/relaxed;
	bh=V62YUJn26P+2CeK2HuDDMCto/wmjFgIv6iOI7Q5QsvQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DAXi+JDRXOUxaj+fJxIfZVs9I7EWAY3cKO0uxUPwIJjFaKdnzbkb3jCGf27Vdo2q99VYWcqHGXs3sHL7BRFud0cBv1UQOBlFrnikKM2f1vqglZV3iIQPMKgjlBJ3Md+d+MF0mN2s2t63rtHUVqiLuTBeAJ6xC+NJaMM+ocGWstBfUKhYvShAe+LsDf7fanbLeS6n5sm/1OJ7Urwrbd/wllx8E3f2WuB4nuT2wA4/xAo9gNJHdAWkBocFLrz3ygmeKh0PBN26iEzJr91KZ/FbJSCzedrKiMuyJM8czIgbz0mz9O71bORY3uxt0qaBx3LuCt1eTyXkwbw3vaMGHtjL7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ieisystem.com; spf=pass (client-ip=210.51.26.145; helo=unicom145.biz-email.net; envelope-from=fanyi@ieisystem.com; receiver=lists.ozlabs.org) smtp.mailfrom=ieisystem.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ieisystem.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ieisystem.com (client-ip=210.51.26.145; helo=unicom145.biz-email.net; envelope-from=fanyi@ieisystem.com; receiver=lists.ozlabs.org)
Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRPMC15rgz2y8d
	for <openbmc@lists.ozlabs.org>; Mon,  6 Jan 2025 17:25:55 +1100 (AEDT)
Received: from unicom145.biz-email.net
        by unicom145.biz-email.net ((D)) with ASMTP id DXF00146;
        Mon, 06 Jan 2025 14:25:46 +0800
Received: from LCXXEX09.ad.ieisystem.com (10.125.2.9) by
 LCXXEX01.ad.ieisystem.com (10.125.2.1) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 6 Jan 2025 14:25:40 +0800
Received: from LCXXEX09.ad.ieisystem.com ([fe80::264a:3c55:1871:7af4]) by
 LCXXEX09.ad.ieisystem.com ([fe80::264a:3c55:1871:7af4%12]) with mapi id
 15.02.1544.011; Mon, 6 Jan 2025 14:25:40 +0800
From: =?utf-8?B?VmFudGxlciBGYW4gKOiMg+ebiik=?= <fanyi@ieisystem.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?utf-8?B?562U5aSNOiBDb25zdWx0YXRpb24gb24gdGhlIGludmFsaWRhdGlvbiBvZiBP?=
 =?utf-8?Q?penBMC_IMA/EVM_function?=
Thread-Topic: Consultation on the invalidation of OpenBMC IMA/EVM function
Thread-Index: AQHbXidBfTZXqoo4QPqygPb5il0wS7MJSu4w
Date: Mon, 6 Jan 2025 06:25:39 +0000
Message-ID: <facece932ace4336adab3a211ae13617@ieisystem.com>
References: <6f4e4aa3bdaf4f199e8af80bfac4df4a4-1-25linux.ibm.com@g.corp-email.com>
 <92D9D801-5FB2-4F74-87FD-196389F10B1D@linux.ibm.com>
In-Reply-To: <92D9D801-5FB2-4F74-87FD-196389F10B1D@linux.ibm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.129.33.106]
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_009A_01DB6046.CCA627A0"
MIME-Version: 1.0
tUid: 20251061425468a1304ad7d42c19710d0d426145ca8ab
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 07 Jan 2025 09:43:11 +1100
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
Cc: "stefanb@linux.ibm.com" <stefanb@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_NextPart_000_009A_01DB6046.CCA627A0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks everyone=E2=80=98s help a lot. After that email, I tried more =
methods, It can work now but can't load key from filesystem.
Here are my modifications:
	Add these cfg in ima.cfg:
	CONFIG_TMPFS_XATTR=3Dy
	CONFIG_SQUASHFS_XATTR=3Dy      # these two cfgs can find in =
https://gerrit.openbmc.org/c/openbmc/openbmc/+/66419/20
	CONFIG_IMA_APPRAISE=3Dy         # I need appraise func
	CONFIG_IMA_LOAD_X509=3Dy       # with this cfg, kernel will load x509 =
keys at init
	CONFIG_IMA_X509_PATH=3D"/etc/keys/x509_ima.der"  # default is =
/etc/keys/x509_ima.der, but my test will show an error log "integrity: =
Unable to open file: /etc/keys/x509_ima.der (-2)", so I use this cfg to =
test other path

Hope these can be helpful. I will try more to solve this problem.
Best wishes for you

-----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: Adriana Kobylak [mailto:anoo@linux.ibm.com] =

=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2025=E5=B9=B41=E6=9C=884=E6=97=A5 =
5:34
=E6=94=B6=E4=BB=B6=E4=BA=BA: Vantler Fan (=E8=8C=83=E7=9B=8A) =
<fanyi@ieisystem.com>
=E6=8A=84=E9=80=81: openbmc@lists.ozlabs.org; Stefan Berger =
<stefanb@linux.ibm.com>; patrick@stwcx.xyz
=E4=B8=BB=E9=A2=98: Re: Consultation on the invalidation of OpenBMC =
IMA/EVM function

At IBM, we're picking up Stefan's work this year to get the series =
merged and enable IMA on the p10bmc system (AST2600-based). Feel free to =
follow the updates on the series (there should be patch updates in the =
next few weeks), and/or try the series out on your platform.


> On Dec 20, 2024, at 9:43=E2=80=AFAM, Patrick Williams =
<patrick@stwcx.xyz> wrote:
>=20
> On Thu, Dec 19, 2024 at 07:52:55AM +0000, Vantler Fan =
(=E8=8C=83=E7=9B=8A) wrote:
>>=20
>>      I have a problem with IMA/EVM func of OpenBMC. I enabled IMA=20
>> function, but it doesn't seem to work.
>=20
> I don't know of anyone actively using IMA on OpenBMC.
>=20
> Stefan Berger @ IBM was working on a commit sequence at one point but=20
> I haven't see much activity there.
>=20
>   https://gerrit.openbmc.org/c/openbmc/openbmc/+/74136/2
>=20
> --
> Patrick Williams


------=_NextPart_000_009A_01DB6046.CCA627A0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
FoAU8IcflaHQ7/sKyg+q3UNeA/+6KTwwggEiBgNVHR8EggEZMIIBFTCCARGgggENoIIBCYaBwmxk
YXA6Ly8vQ049YWQtTENYWEpOQ0EwMS1DQSxDTj1MQ1hYSk5DQTAxLENOPUNEUCxDTj1QdWJsaWMl
MjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPWFkLERDPWll
aXN5c3RlbSxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNz
PWNSTERpc3RyaWJ1dGlvblBvaW50hkJodHRwOi8vTENYWEpOQ0EwMS5hZC5pZWlzeXN0ZW0uY29t
L0NlcnRFbnJvbGwvYWQtTENYWEpOQ0EwMS1DQS5jcmwwggE4BggrBgEFBQcBAQSCASowggEmMIG3
BggrBgEFBQcwAoaBqmxkYXA6Ly8vQ049YWQtTENYWEpOQ0EwMS1DQSxDTj1BSUEsQ049UHVibGlj
JTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1hZCxEQz1p
ZWlzeXN0ZW0sREM9Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1jZXJ0aWZpY2F0
aW9uQXV0aG9yaXR5MGoGCCsGAQUFBzAChl5odHRwOi8vTENYWEpOQ0EwMS5hZC5pZWlzeXN0ZW0u
Y29tL0NlcnRFbnJvbGwvTENYWEpOQ0EwMS5hZC5pZWlzeXN0ZW0uY29tX2FkLUxDWFhKTkNBMDEt
Q0EuY3J0MCkGA1UdJQQiMCAGCisGAQQBgjcKAwQGCCsGAQUFBwMEBggrBgEFBQcDAjA1BgkrBgEE
AYI3FQoEKDAmMAwGCisGAQQBgjcKAwQwCgYIKwYBBQUHAwQwCgYIKwYBBQUHAwIwQwYDVR0RBDww
OqAjBgorBgEEAYI3FAIDoBUME2ZhbnlpQGllaXN5c3RlbS5jb22BE2ZhbnlpQGllaXN5c3RlbS5j
b20wTQYJKwYBBAGCNxkCBEAwPqA8BgorBgEEAYI3GQIBoC4ELFMtMS01LTIxLTE1MjM2ODQ3MDkt
NDU5MDQzMDU3LTg0MTgwODU3OS0zMTQ5MA0GCSqGSIb3DQEBCwUAA4IBAQBr0yu7S4f90/Scjv3s
SChUweCbhrTDn00n0FJB4DweuD6G5K7xiYCF8y0OfiezfJmixKE/PpkgGvx+Zt4JHcXkX+rOUssg
aaVv1T7pDW3aCpZAld5lTHYnoGA7uULzeRByG9pO7plmQO0kZd8WE+FUYFk9gFzHwQ7eaxvpHDEh
SIO3cvLyqm3euCTrnWkwYXU6rTZi5wPl+FJrQsSPgxnx2omo5K6igg4AWJ1dsRNx42rJVvXfh/cx
WMU6eTNvBynOA+GqfmYDZQrX9r2Ook5JvV/VIn+vTsp7Cyz2y321gA1LyFpGdlk9O5TVcoGId9cg
OpZDOkwCn0F42aFxo+qMMYIDYjCCA14CAQEwdjBfMRMwEQYKCZImiZPyLGQBGRYDY29tMRkwFwYK
CZImiZPyLGQBGRYJaWVpc3lzdGVtMRIwEAYKCZImiZPyLGQBGRYCYWQxGTAXBgNVBAMTEGFkLUxD
WFhKTkNBMDEtQ0ECE0QAAAJ7zO06vfvDK5QAAAAAAnswCQYFKw4DAhoFAKCCAcEwGAYJKoZIhvcN
AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUwMTA2MDYyNTEzWjAjBgkqhkiG9w0B
CQQxFgQUQtnJKGFDHvu5cOzgyonUhFjfyVowUAYJKoZIhvcNAQkPMUMwQTAKBggqhkiG9w0DBzAO
BggqhkiG9w0DAgICAIAwCwYJYIZIAWUCAQEEMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIaMIGFBgkr
BgEEAYI3EAQxeDB2MF8xEzARBgoJkiaJk/IsZAEZFgNjb20xGTAXBgoJkiaJk/IsZAEZFglpZWlz
eXN0ZW0xEjAQBgoJkiaJk/IsZAEZFgJhZDEZMBcGA1UEAxMQYWQtTENYWEpOQ0EwMS1DQQITRAAA
AnvM7Tq9+8MrlAAAAAACezCBhwYLKoZIhvcNAQkQAgsxeKB2MF8xEzARBgoJkiaJk/IsZAEZFgNj
b20xGTAXBgoJkiaJk/IsZAEZFglpZWlzeXN0ZW0xEjAQBgoJkiaJk/IsZAEZFgJhZDEZMBcGA1UE
AxMQYWQtTENYWEpOQ0EwMS1DQQITRAAAAnvM7Tq9+8MrlAAAAAACezANBgkqhkiG9w0BAQEFAASC
AQCc8TOrsFiEU/V51cUM9ft+dCqdHiHCeXQN7b3aIG/lePYNsge6H6VvgH0Ulb4mUVG5NXXBT0yf
7q0xhgplFphCN3GTjHoqizgi1f8XLP9UeZjp3zQoFfFSVLyiqPymt2umZBRIqhjeYY5horVkXZQK
dXBLLkXjq+YPnCV3bWVWkQ8ecuTQJ0tRmM90cCR9okRMGAIN+dE52Ii+XxabVzCcqw3lm7GQMQ0Q
hseaxDPEVxwU/EqvF5V6U7BBr9n5YjP8HQAaxgFNu7TNZmoi1PDQfSW6jHXfoyn+GJZ3/xrKDNBp
rxQwaffzNVEQo9eOx1ViEqG7WXd6nxxCrCAicQnJAAAAAAAA

------=_NextPart_000_009A_01DB6046.CCA627A0--
