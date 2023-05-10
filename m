Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C296FD9CB
	for <lists+openbmc@lfdr.de>; Wed, 10 May 2023 10:43:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGT8P400qz3fNT
	for <lists+openbmc@lfdr.de>; Wed, 10 May 2023 18:43:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=OIesuZAg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com (client-ip=74.6.130.40; helo=sonic308-1.consmr.mail.bf2.yahoo.com; envelope-from=erhan14@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=OIesuZAg;
	dkim-atps=neutral
Received: from sonic308-1.consmr.mail.bf2.yahoo.com (sonic308-1.consmr.mail.bf2.yahoo.com [74.6.130.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGT7n6m5Wz3cjD
	for <openbmc@lists.ozlabs.org>; Wed, 10 May 2023 18:43:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1683708191; bh=NQUNVEFem4DqDCfOZaC9GNsD5OZShlCJK0tRRTAm0ko=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=OIesuZAgdtTueJZg0/WX7w7cBdje603Nmo3kBukxesh2XKfEZP2XkZnICYHCCnQ4seAj+yCQEG8eG+RHpy+eY3PxT9NqKRbIq4ag+rrxTH+XBczdKarT7rDLFWKU41m0cro56HAvg22JwPofZaj/7bTSlWUZhLgjaf4MZOz4/RfYgAIMRyhqPmHjmsqpxeX+YXtk4NDcSs2lxIZrbbFJcvVSeu4pRTmf5CncAI0hL8HUecq6l9toQwEPRyGDCJodPJTxZYeRsXbWaq3Ze+Kdo0Uwb3i9FkcAoXrLPkhEXkxn4WX1bwivaa6EiGxBMIpMe0zxTNPe51uzuI0eWxAiag==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1683708191; bh=6rtvbXHfcoKyHp9J2iwyQAUKmwxbxvsRdhv8dPDMmwJ=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=UGkJR7/AoScNVekb7wW+kWZaIF5mZPPnFUkZg48dKYuAQBdq8jltcG1y7mgVnWTgABdO5JwMO3qdAc1pMoF1TgzNCdCkIs0mcmbf6Hgu7bpWPdgX1PD9ie0BPUwUpJSLxUPRliPC1mLQhCc7zyAywIrcUVWDc5/TmgwPyW1PQyRIlRnSFMvTL4tw5yYr8+PufVXxNM/xkPdeaZIIDlX/s9mdEu1OCCH483SnVWCcYF5U1lW4+KygxQs3UCIU55i9K6CnRceVPzjZ7ymxkSDgJv7SDIc2kF93g79oMkz0Na9SUv+dgxtJg/SRiCa8tRw5fVc5W2DmTpFG9Y67kc2Bdw==
X-YMail-OSG: 8.GzF00VM1kdsAp1PH8dboJu7ngtKYuMjEjdn6U5vNNc2I0cH0bZy1.PT8_0gpR
 W4aVQKLAJwXK3YSFiQiiXFjLykHtHNli0aaZJul.EdayxlVP9iiBlbHPtrMbneByJVTBMsais.TT
 zACSKbB9Y8bAjGS.FWUY65cxFJsR3frCpxDQs_4zOfJaW_LqNgWEhPKfpugoLGAIYmUr5qwmv0RE
 22BWfCeP0uM_IN4J7RgXuiSoxPIyRsm59hxzq.y376mUHgx3BNuDna7G_9Rxn6AD3oc6jcfuJ5Tj
 R9IiU3wRCmLXEax9B2P8oj7UnRTjTTRZkMK3pPZMdgbd6ZlPvQkhZZs9NIqW1C288RW0AD2ERUxp
 vuJI1ylrm83bTvSu5LHV0aQLMZETwzX1l4_qgQt_sbvTXZSy7UpclxhjNb_43CSIJ6iwASB6D04X
 genZmSod4.wJYtRXy8H15xahENyErPu19Ex0zU7ptG06aAxljKGEcw_QOQiKHAfhQSU.pdulKNxK
 efZBD7UdegiOLOTH9i3zqOYlU5efrpK9a7T89OqJ_DRgCrsUTKOh1V3G4Dc07yIuXWQXwPoqncyr
 MIvS69.zYYQ2skBanwp3Gsm.sZsAQXe0kkFJO01jS9_VkqmagWmn0.jqN0Tbn4RIYeydS6kei7_J
 .mtDsJjlfKcGBPBZCkMxzoUupzN3DsFk3RQXptk6AVTI1JG7TOr_.OmGBjrOmnnx7IXdKH_bfgfZ
 6GSg_SKy3MF.dvs8QNABDhnUEgDi8TstgcFIOBymHHBgzu3hWww8_W0kKc6SDW.YFEyaCdmVGs82
 oSTMAjzVW5nByXYuiOiZVmu9zNLxtPKHfi0hPMn6PK9H3IuCZ6C93g_qH8j4d880mxe8cMR8e_Yu
 xq900JRVqNCz8a8rJCXape8ZlGdHtUIeuTon4uxR0HiyS8ELAVl2X2F_6jE8UJQL0VA0mxxKWbvO
 nK.geajrIZVsKnk5oEAI1gLqsta9yKCBq1S2OT7SWy50L4B_UFMeFKim1dfmLTHItzGScKQel9PJ
 qSAWsdmLn.VRfV1MWmdU9ErCRrpb.S3FngJh7HAV68IsVzNjzXGLQMiUiOYmDSTdkFOQOawmSw_Q
 14uLsi7Vr5hTvRWGWeTR.rNQox.OKqjoxU.EMrVhYiqvuBl8boKwx4HVEv1daGIfHFEik_y0pllX
 BiEyV.dJ85CBHv0r.KrBRqxqbu1NvauvwU8IJulLbeGPrf1nYpEJTOYj0.RrFgJjtMxWUtshZEHR
 XCGrx1fx4wgQ5Zs_Niz5eMN.WvVjHxczVz4KW4HfLjBWyoscWeS3x8ta_trhwflfxhla7RQ2Yale
 gExKIDev15Hya2XF2HXwq9Vsi4EF.iIZNkdi9J9eiclFWsrMOnlWAGoIYq8GxjyjuRAY6U3cOHRM
 O8SSyTa._yjEEiKlJl66Zaw15IaIrqK3nfMLm1ntkCTtVpRMDgNSjfX9lYkFkILE6QvqJg6PZsIU
 jVJwc8x.KOEutXhpjYLMk0NDW0DTaWGhnWL.im8koIivwsM50FcfAf3tQbHdPffPco00uRfECV.f
 VS2pNNxqHufcFKzCJ5M205aofnMiJqOhQPA6gIMN893bvjRfctYdC2Lvv5yUFkbLgTcmkwHlM5r5
 5dakKbHt17kPPw78QUVjuEXqOD9ZJ0s4YLUxoGNU2gtaX7Y94eo6NWhei.9MNVDpK0mEq1Z1TX3Q
 b1Bsge99o7q0thNHW0rSUf9Ho9g7ma15mhlT4IOVp7z9JqOtjtfyh4Tef8uWUXL1xwERiOZ44cno
 WRUkzSux8HRbPCtkH96vrgAKydRV8o2J0.GeNJdkKwoaU.zu23QHNP2N5X3kIMMY20DAGrk05sg9
 O7xYBKddFSoostdkMdbsq4uGlZtwyoyDXGG7cCckdpsL.UkCh0g4WFDxFhx7z0wCV3UmGtum_ItF
 Vehq64Sy2bLmWgCOcN9RGvSfIcKdPuiXOPKuVzl1WutlHg93jDpdPIUoLlY5UDOb23H0hTOHlCTV
 lSqRXhvTyGFvggP.rJjqiv5o3CYpfaoEtEUnkrdswL7dytEBt7O6TdBRzQQtLBb7c3z8DZN7EEN0
 YzoRaamEu_CTHw6IJ7FQYwkDPJUP6PSSqnMJ_rx0w9jb7OyugtvMmBT4r.TpxLCGL0jSA6qcbqJT
 9H.o.aiaUjNubNDCBonMTeOw4NnbFX7DUhYAtldYuD9I0Ilq9LOeo
X-Sonic-MF: <erhan14@yahoo.com>
X-Sonic-ID: de159bce-9537-4a20-8be8-b4f92a69a579
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.bf2.yahoo.com with HTTP; Wed, 10 May 2023 08:43:11 +0000
Date: Wed, 10 May 2023 08:43:08 +0000 (UTC)
From: "Erhan Y." <erhan14@yahoo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <334816234.178220.1683708188909@mail.yahoo.com>
Subject: Intel RSD FW Extension IPMI Commands
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_178219_1192170057.1683708188908"
References: <334816234.178220.1683708188909.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.21471 YMailNorrin
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

------=_Part_178219_1192170057.1683708188908
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,Is there any implementation of Intel RSD FW extension IPMI commands in e=
ither intel-ipmi-oem or ipmid itself?Our BIOS is sending group extension (0=
x2C) network function code by defining body id as (0x04: Intel RSD) for MDR=
 commands.We want to get SMBIOS data from this BIOS.I suppose we have to im=
plement the commands defined in this document :=C2=A0https://www.intel.com/=
content/dam/www/public/us/en/documents/guides/firmware-extension-spec-v2-3.=
pdfThanks

------=_Part_178219_1192170057.1683708188908
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div dir=
=3D"ltr" data-setdir=3D"false">Hi,</div><div dir=3D"ltr" data-setdir=3D"fal=
se">Is there any implementation of Intel RSD FW extension IPMI commands in =
either intel-ipmi-oem or ipmid itself?</div><div dir=3D"ltr" data-setdir=3D=
"false">Our BIOS is sending group extension (0x2C) network function code by=
 defining body id as (0x04: Intel RSD) for MDR commands.</div><div dir=3D"l=
tr" data-setdir=3D"false">We want to get SMBIOS data from this BIOS.</div><=
div dir=3D"ltr" data-setdir=3D"false">I suppose we have to implement the co=
mmands defined in this document :&nbsp;<a href=3D"https://www.intel.com/con=
tent/dam/www/public/us/en/documents/guides/firmware-extension-spec-v2-3.pdf=
" rel=3D"nofollow" target=3D"_blank">https://www.intel.com/content/dam/www/=
public/us/en/documents/guides/firmware-extension-spec-v2-3.pdf</a></div><di=
v dir=3D"ltr" data-setdir=3D"false">Thanks</div><div dir=3D"ltr" data-setdi=
r=3D"false"><br></div></div></body></html>
------=_Part_178219_1192170057.1683708188908--
