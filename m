Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C9D57FD99
	for <lists+openbmc@lfdr.de>; Mon, 25 Jul 2022 12:35:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrxJW0jZDz3bnM
	for <lists+openbmc@lfdr.de>; Mon, 25 Jul 2022 20:35:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=nCnUnJxl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com (client-ip=77.238.177.30; helo=sonic310-57.consmr.mail.ir2.yahoo.com; envelope-from=niikita@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=nCnUnJxl;
	dkim-atps=neutral
Received: from sonic310-57.consmr.mail.ir2.yahoo.com (sonic310-57.consmr.mail.ir2.yahoo.com [77.238.177.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrxJ25yJXz3bXZ
	for <openbmc@lists.ozlabs.org>; Mon, 25 Jul 2022 20:34:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1658745290; bh=0KZuVeT1CSZQGVSbEfttrhQDWo0BhO18dM8vWd2HJZY=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=nCnUnJxl9Ietf5bgwAGGfLxMx8lLiDAjwEUJKn/6PeybDyAOCi242VtStrKTwogJoslQ9zkRSQezOZbI/JvlnoURRwrfW+ZaIhxdDR/fsGnbpwGIlsWds62yxPpjYS0l29TKTrvBhbRYshtNwqW14KHb5LgrP+vwefkCfzwUUYpj+C4hD2ElM+fJ2qQMm6YUlzAG/UMl7+3Suqq1lSqvo6gQbmYYA6bnafyE11NWGtLFWTc6Vl67iSM440q9F7fc0Dme/Juw1t4jUrV+BckF3gyzFUFX5anBlCpF6r/kCYLJ1xPkXCG8h31ArTzNaeSqzkJRtF6h6hRlU0sllvsHjQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1658745290; bh=Ky3oL0JIDmxOc1/kB8HnjM228VDg8+3pvNLeFmCFXC+=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=pEr1YY3LKyyVlCRccjQYGkHqy/UoHCCOC9naOp7JvNFG134cZIYMZF1QLnvL0DhHWYHTusbO+wd0VWscB6/NeuvXw1iQhVar/VpI6Q+RVCKyYA6uDMu6g918eVp5sT7b9J7kSviSuBMRYJQYemT4HX/nanD5JDvWvptSQzLXMzVFfaJuzYC1rBFoWxdeDdUgETwhp10YfO2augm8rUgrCNHQJNSN55IuKMynYEOWU8PvbQzQiwcC4b/COlh8Xmvw0Mkswq2NXFeHW4zoQW2t8uvwgi+5Ale8frqZlSqMS1gFTag4eQVP0x9mwc9/wqMBcIgDOEB/HbYSk5nxerkjsg==
X-YMail-OSG: EIvO20AVM1nJqbwyCabVbk1frV65SZCJ3_NZ0zGj6GuJ4gjEc7ENAJOGpKimEoD
 nmja1_uiph2v6AS55AqSW9r04GqC.uGTujvtssnmvDjeeYSllLqNvqrvgvkNysoOVtJbWQzIfjTd
 oO2aaBVimGiolFP.8qVk90whWEW3SPdLqUDaKhxFBl8b_9fQ1pmR26updkqYt5gcAMDm8hJ0sbOj
 Fm0_spQl56kwNoPJf8Ioxa1fdIbhBWiviyB4iDLvoSEwNSmGkczeaFjl7sqh3aNRolHCsQRcA_Bf
 tq6.UrfBZjs3kEBuptJsM5.XCL7tKCPXwqvV9RQojbvN5nKUqWI.19VFcPf5OwXBuqaKg.N7ctBm
 Rgvg2Q0EmbVeLkRoE7WmzKxREAsGl9J6WFu1piV35Qjfpzpl3Dy9Dohafsj0Cya0xUZ5tRM68Sa2
 MRWQKleO_TBVYgvYXGKEQ0UmqeAZLCxQ8nehvHxhh_DLh8JdpPxzsBV5XBpnaErDGmBbN8eMugke
 hylxkGy0IuAUOa.gJrxUn3vJsygOmic82HK8l0sOiKyYAAsIdoQUBlR7B1Nhlhs1kobVAlNJUxDZ
 RIzMV8sCgdGwRc1b9kqXM5lPB4YjLGRqYCkCMbSyWZ4T2ivx.Z_BnihiZV9zbYk39QgZkd0invm4
 zwi3zZCxvkw5HzouqtxVVlcXEUkxgxk8ZeesFwVD0FItKF07Ird1M46pCel_pKqnQyzcNTXSKTrW
 tVpsHtKFbYKLb7Ay8s6a_RF5yECFNTKaxrOYL9XVSKa2FHV77KQ0jpMoEazf_P_bR.3UAwTTmbOp
 EjfDZa0vSL08Pl6yGSka4f74TYAV7Lm9ezBdinAhoh5SnlIcza54_lYDeNUqoCtK.EPrv6RaVzTI
 rV12VeKXLMnaICzGG.WEK1MwbPp4x_9BMsmhcjpx_vZ0OfWEADRXW75BKa_lqhOJ.5xEhRMcFR.4
 QdJMv2lmDyv1ILkrZ43HywQKA7mBrEQwoqMSaa6YFMY6mvQZ8tkDWYZ.qwTXKNjSHtdsdGQOpZ8T
 clrjJkJpjN7JQs6TIGIbruY0D5Kkn.wUkUE5JwsvbKhyKr0FQxPZ0VEZGPcwjSmcot4cngWHCpPK
 nfhSocb0cbWhTnaIIyFD49oG_f1.QbpHcqa2eysCLiVJG3Et.unS9N8BqqAyfNp_OYM1E32mfjkh
 0UPy_SMxCEjVaPcMfYJ6.jYfXJmViucACKh5eyodRkQoYd5kNj3Anx3.Wjjp.ZkltkPPqDH.VM_a
 SWuzAMcXPe18cDeiOcnRa5INy8Y9SwCvBOCjYg5G0EvLDCRMrR4qgFZW.pukQK8mbWkKuUeGESdW
 zhtma9xrZnMl9tpJdMDigMRHjoJ8YdorEUjLtE75p_K5pksNcG4VfLJPTtiSiFsqbX67Hge5vGL6
 ds_iyAXnJNV8o4qvaYh3jXHsB7Uzkz3.uZawT_K0FxM2myHAP3aKUT8_JE1wSQrqMcxVswiNf3I4
 2q3YOj9GNy.rI4nzPuhdz2X4oHIKaQbP8HUhQD95QbvobLPboGQSEJGz0Wnp566I.r2arA4eA9kh
 iOl9BTC2npEfi2GdyELjCRYv_Hfa2M5praJgQucdyxcCZGSRGHf8KkuZH2jqjfU4Ur_apGAqU3pf
 JKYbHv_UZ532rErAFn5J4dCXsD8gd.Xrsdk7.rBOqtHlvp2IhSCS1kQlwqn3NOcM6O0rMXXQSNNN
 MmgxUhWgd3g75Gvcmlm6HlsW9Rg1xqRWXhgme5FMbbT3oVSYhe7.8J82m.SacvWj9a_DrVeI1vRR
 ODmhcqCGe7lp9FkSSBgXbfMinwo7iPProMBuNMZh9KkXuERS_caZM2LB3XUSP0BAMXfC_Li6zdSK
 YcQULWeclf75PtaaZzZGN18HwohsoNOiZEsY1OlVaIoGC2FIrxkjAqGAz7LzaQvu01I5iuBNS_0C
 KeMN9wC6pFy2bCZukq8aF99XGoo4od_NAtIYVsPsjwibnWUIxMYFKyOln37GRUUBSQRlRZuKgZCm
 vtvOmDt2AWl.2mQJsEY6JkQ3fxbk1z9z7m4A3KC4SX80U41_V9TWdvGKHgG8z1E4FndyspaL6A97
 gHrh0tWB.zl5IEqcdJUC1KAMbYx5SK9TZb7qKBQ2gmCTejeHA0n5OIKZcFYSRsSYEBoI-
X-Sonic-MF: <niikita@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ir2.yahoo.com with HTTP; Mon, 25 Jul 2022 10:34:50 +0000
Date: Mon, 25 Jul 2022 10:34:38 +0000 (UTC)
From: Nikita Pavlov <niikita@yahoo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <800107506.2442690.1658745278973@mail.yahoo.com>
Subject: problem with displayed peci temperature sensors in webui
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2442689_1701921993.1658745278972"
References: <800107506.2442690.1658745278973.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.20447 YMailNorrin
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

------=_Part_2442689_1701921993.1658745278972
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,I have problem with display temperature sensors in webui.=C2=A0 On hwmon=
 dbus bus I have some sensors like ambient, inlet and etc. and this sensors=
 displayed in webui. Also I have peci sensors. Hwmon read peci files and se=
t values on dbus. But peci values are not displayed in webui. As a result, =
all sensors except the peci are displayed in the webui.=C2=A0How I can debu=
g this or=C2=A0maybe someone faced this problem ?=C2=A0 =C2=A0 =C2=A0=C2=A0
--
Best regards,
Nikita Pavlov
NUST MISiS studentniikita@yahoo.com


------=_Part_2442689_1701921993.1658745278972
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp30de8b9byahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div dir=3D"ltr" data-setdir=3D"false">Hi,</div><div dir=3D"ltr" data-se=
tdir=3D"false">I have problem with display temperature sensors in webui.&nb=
sp; On hwmon dbus bus I have some sensors like ambient, inlet and etc. and =
this sensors displayed in webui. Also I have peci sensors. Hwmon read peci =
files and set values on dbus. But peci values are not displayed in webui. A=
<span>s a result, all sensors except the peci are displayed in the webui.&n=
bsp;</span>How I can debug this or&nbsp;<span>maybe someone faced this prob=
lem ?</span>&nbsp; &nbsp; &nbsp;&nbsp;</div><div><br></div><div class=3D"yd=
p30de8b9bsignature"><div dir=3D"ltr" style=3D"font-family:Helvetica, Arial,=
 sans-serif;font-size:16px;"><div><span style=3D"font-family:Helvetica, Ari=
al, sans-serif;">--</span><br clear=3D"none" style=3D"font-family:Helvetica=
, Arial, sans-serif;"><span style=3D"font-family:Helvetica, Arial, sans-ser=
if;">Best regards,</span><br clear=3D"none" style=3D"font-family:Helvetica,=
 Arial, sans-serif;"><span style=3D"font-family:Helvetica, Arial, sans-seri=
f;">Nikita Pavlov</span><br clear=3D"none" style=3D"font-family:Helvetica, =
Arial, sans-serif;">NUST MISiS student</div><div dir=3D"ltr"><span><span st=
yle=3D"color:rgb(0, 0, 0);font-family:Arial, sans-serif;font-size:14px;whit=
e-space:nowrap;">niikita@yahoo.com</span></span><br></div><br></div></div><=
/div></body></html>
------=_Part_2442689_1701921993.1658745278972--
