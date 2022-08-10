Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC12658EC68
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 14:56:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2qh652x7z3bcc
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 22:56:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=oIaK/Lbe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com (client-ip=74.6.134.40; helo=sonic307-1.consmr.mail.bf2.yahoo.com; envelope-from=erhan14@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=oIaK/Lbe;
	dkim-atps=neutral
Received: from sonic307-1.consmr.mail.bf2.yahoo.com (sonic307-1.consmr.mail.bf2.yahoo.com [74.6.134.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2qgj6tPDz2xXS
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 22:56:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1660136171; bh=gF6LRR2wTd/QR0PIfOAaOKHHPUmlxuiD53M5JUhxdBU=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=oIaK/LbeW0NAMJPcPVFBo7o14lcIJ7u4ETvWCPwYpOm9wl9gEHpUFRcIunGtSEqFha+xtxkHW9bhIMWWil9oqcU+tgBsgyVit4pJ8jfoBIHtDp009j2Ia2SjQ6A3leoT2htjj6iocN3DREowWONqciiP21ezcIGXyNcM4TWTICCdls89JePB9bCAjCSZOvKaJ04U7EUJdc4RKswoSxxgZzGGCA6tb7bmUWPgAhKaTlwq0++JFKlZ/f81UedoDWHQKliYwPfJAWwr0b+dP00DIVf+qGcKfvFkmJ1u2qcXIkIU6ElRyaZFeJKf/RewvWH63WP8fc1yQPzzwFP1BEL0zQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1660136171; bh=edq73M1NchVgLYUeg7JDapxuUBh5Tb1Q+A2UNZ5eCT9=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=iCnoxAtYCYRecbWcJ5+iewAzbjD/f21dHhSQAbHwtXn6D7deSBDSSA8G785JEwYIzETuNEIL2BCiWpGMxWj8IKjPcl8v4bXUQ3U7on6udUrDrHsMP7Zsqs1qeBBXgaYgoigJWjToE3hx/Z0WKud0qpl6tpVdFvjetaVQcUpQWk7MEr8AxkwnbpbNKjdusq/pA9OYJYL+4PMBW0yEi20hzLX8s29dCKOoo+E451emiCxlzM5xhPyfLn4r6bK6r8uRMt4vU7T2xFIlCXG1jzZR3E5fOZqwwbTUFZtP/K7jR8YfL2UPrS3uQ9MY2n54o2/Wvve40eUK5RT3b6krYU/Kdg==
X-YMail-OSG: CAD9L0IVM1m5RS1Vavcb7MlY16p6t6JMfF9OOLLKCBjVv9tDKs0AH_Sbj2XUhKS
 rFtSaL5lU9gg1r7ezDBBi0RX5AN.OvO5dPpyxbdvUuoGAJEzH2Owvt86aiX81dsTAVpS5sczbiOg
 L0zMt4GhuBH.dsqKS5S5X6hsTcsK_6xpluxvJI0JmGVkXe27XQE.3.0cNAmL9p7xcOL33PfQarps
 xknbzo1GUxUVP65YJksuDMyRk5ap2guBZLk62U4Vvn07ohggOhiot2GCEqtx3ym7RZFOGWWzEyUG
 ncmc2JU.HOxbi3dWRbyZ0wPuSFLGHFTbtnp61144FkyK5tiEmyyZEgvz2DZcqz6pLVBGf_y3JtQ_
 0F7FfmCGWvoCMlxEJ_DrZFEo6lLEHp16b1cH2Z49CYq3qwdw8_owY6xyfQDiN6yy8HaQhT5Q0o9q
 .F9LfIZwqejIN52bxvL53AQny3X1H56FLs3d7cCvh9zQY6RswcfJ9EQaGcoEq5BqDpr3YL25mbsP
 _bhcvYUa4W.98DpLe_2eHOTDouVzosLetvrtLZSJhHqEaKAJ4u7UMilzoe7H8jNZvffr7Jt70eVl
 lT1AuaNERuFwYFZpGI9WPaLQaTZBxZZs71.NJg2di9Ai.6PD0EvfR1CImBm7sNKpo32IQiTFKTz7
 3Wkj4Manx_RhBe38qqTfR2hz.wr8zzbrvf5ruphovXWwUWSc6JCtCHEZsm2G4U_DFhdz7iXrPaSH
 3CV7u6xsQwqH8VTVUPe5TIMa2rkED4w.SLdMKTpvt8ZCjT9yov78oK1wg6v0FmkjuSrB8MzSvP3i
 41SxzIoB5Zg3UkVz4REKylPbxwRQMuHHNI1CPzrEubhl4VUAWJI94hCXR6UKSPqRLXxDI.gtUIGH
 Je5pAJ21wiaMMpCxNhFdZMtBTUReIpQo2lAKTxv_o1Hb0BkJ88QZspF2npJDFe.zAsnHx6CnILhB
 F_JPjpiXRJXx.LfaPDNHhtcGNUmZnt6f9dOP.gvlG2GqfaXX7rhG50J0OqOFbuxe8MP2kpZFWJJT
 aHiPZySKuh3EH.7cE51_06lMP5MWRCbtrmcM5hN2yM5uqxcQQe7Zeim6wYjjdaAqf8s.L40EjxzL
 d5.dKGOB1pnhbKFgsVjelGL2Ysw7aX2q.HMgvbtyRMzbaEpeOygc865lC.rsturtHynulW25Mjpp
 iDIMk7lZpyc424C1bW135ujq4OkQwz32zIDR2FDhXtjsnMJ.6YT.wqAPIUipm.HAmELCvkQNI9Ph
 W.S85pv91wFBUgVF9jsWm2nJPrlA1ONHRfEPGUGngkfElL40bpxWVH.WbeNg3X4xy59rZdUc7cvV
 FW.f_DdqBE84xHljs_pM9oq26U2xu1RS2.MkjO1_lqAEmzNj7ocZoVhgl3wDlQjQ9DAxWXmJMoC0
 qRn5Tu6GlCdLVIad_FKv61J5Gks4qJ6J1XWunO4sv5UiTexF.XCCW6qQnSfVv6bWFTu9gMDWWXIC
 NrHif6XRJosfmBUId9J0NSjk1xfnAHZF4jWU.wxdLo9KGQST5x3mqczCylRwR735z9dGAK8f.V7g
 Q9FZWBPbYVZXn.QX0ikWaGpXEmICleaa527FTSmJ089yHLHCScKMQkbD1bpudN8PWeKGIagoBSm.
 kJ97C43ANeF_TTNoVSxOHJu2zo4u3VyfN_zG5nkC8rIyuMA_qUDAXjvrfOUS4Cy4GrcrWLPJo.He
 HsKxBmG161h6vR5Ufmiebw6qLvnyh.ad.CdRTmXpiN7AtbtQAq4LSMaAFjRPDBjdEL7w89nRFnqG
 N4e.wh3Zgg.w4y1eMJyMbDEM3EW8qph9dZaQxSc_oPFGlq.R1.ecpEYlh9P.ctQZJwxg31n.G.G3
 7c2AfJff7Kd6n3XFWtq.1BJHjEOH8D1ryxVSk8G_wrwrw_Whw9sAHVIBiXBo.CE5o7Xx44lOXIed
 06ycZBB5PBxRK7v1ulqPm7.U53S9vmSs9PfKmeau3u7gZxwezSlsY6BDObkCc8WvlUbo_uv5fCOf
 bVEWzuC2P6lTVR5ffRy1ZQy3iKxa51JaoxtnT.S0uce.NeJpboUTm9lxTg8mkJ2xSCvpvnQEkiWd
 DUHS4C9OjF8UCVSw3kwEh4vDdpAp4Fk9GMjrvg64QU6k3ZvvJ6nXkJpacBvGCnxL9Ne7ls.uH4SQ
 HM4PajR5NyevmAf9yjgr5upkYMFTXPBD1tcjEMQaWyNLtQTUKcY4KNV67.S9oMKJgbZ4KPk4hndu
 pO3ZG
X-Sonic-MF: <erhan14@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.bf2.yahoo.com with HTTP; Wed, 10 Aug 2022 12:56:11 +0000
Date: Wed, 10 Aug 2022 12:56:07 +0000 (UTC)
From: "Erhan Y." <erhan14@yahoo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <1633133798.1806911.1660136167644@mail.yahoo.com>
Subject: IPMI Sensors
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1806910_891983736.1660136167642"
References: <1633133798.1806911.1660136167644.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.20491 YMailNorrin
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

------=_Part_1806910_891983736.1660136167642
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,We are trying to port OpenBMC for our custom server motherboard. We have=
 added our sensors in "aspeed-ipmi-inventory-sensors.yaml" and "aspeed-ipmi=
-sensors.yaml" files. Then added the hwmon related conf files in our custom=
 meta layer (e.g. hwmon/ahb/apb/bus@1e78a000/i2c-bus@40/temp2@49.conf).=C2=
=A0
After adding and deploying these, we could not see the sensors in the Vue U=
I, but "ipmitool sdr" returns the sensors as in "disabled" state. Then we a=
dded "phosphor-inventory-manager/associations.json" and after that they cam=
e up in GUI. But again when we query with ipmitool, they are still in disab=
led state. We are using kirkstone branch with aspeed-g5 processor.
What are the actual required steps for adding our sensors, cpus, dimms, fan=
s etc.? The documentation is not so clear.Thanks
------=_Part_1806910_891983736.1660136167642
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div dir=
=3D"ltr" data-setdir=3D"false">Hi,</div><div dir=3D"ltr" data-setdir=3D"fal=
se">We are trying to port OpenBMC for our custom server motherboard. We hav=
e added our sensors in "<span>aspeed-ipmi-inventory-sensors.yaml" and "<spa=
n>aspeed-ipmi-sensors.yaml" files. Then added the hwmon related conf files =
in our custom meta layer (e.g. <span>hwmon/ahb/apb/bus@1e78a000/i2c-bus@40/=
temp2@49.conf)</span>.&nbsp;</span></span></div><div dir=3D"ltr" data-setdi=
r=3D"false"><span><span><br></span></span></div><div dir=3D"ltr" data-setdi=
r=3D"false"><span><span>After adding and deploying these, we could not see =
the sensors in the Vue UI, but "ipmitool sdr" returns the sensors as in "di=
sabled" state. Then we added "<span>phosphor-inventory-manager/associations=
.json" and after that they came up in GUI. But again when we query with ipm=
itool, they are still in disabled state. We are using kirkstone branch with=
 aspeed-g5 processor.</span></span></span></div><div dir=3D"ltr" data-setdi=
r=3D"false"><span><span><span><br></span></span></span></div><div dir=3D"lt=
r" data-setdir=3D"false"><span><span><span>What are the actual required ste=
ps for adding our sensors, cpus, dimms, fans etc.? The documentation is not=
 so clear.</span></span></span></div><div dir=3D"ltr" data-setdir=3D"false"=
><span><span><span>Thanks</span></span></span></div></div></body></html>
------=_Part_1806910_891983736.1660136167642--
