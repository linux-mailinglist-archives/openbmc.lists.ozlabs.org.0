Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A4169FB24
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 19:43:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMQ5s0czsz3cBK
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 05:43:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=NLHZ0Ijq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com (client-ip=74.6.133.124; helo=sonic313-14.consmr.mail.bf2.yahoo.com; envelope-from=erhan14@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=NLHZ0Ijq;
	dkim-atps=neutral
Received: from sonic313-14.consmr.mail.bf2.yahoo.com (sonic313-14.consmr.mail.bf2.yahoo.com [74.6.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMQ5C6q1Pz2ynx
	for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2023 05:42:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1677091370; bh=0KSEE4HyS+XH72/nRtIWU2WPf8rtrxc/iQpfdnxIgLk=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=NLHZ0Ijqu3WFZc4qU3ctb6JNsYpH9ftlzSrRmY7TBOpoi8mOCWg/2Gx+HOZw233O+60UL2PXrVRznRmlrSdqfRCr9uwr7ZyMOPi0t3XqFLsnA1ZAdilmssG8ujvt0+VyWp7vtmV0ZCndn2EjCuyrw60oqKl1DdOo0kQ8uov6tTFN6otd8ZfhnGWY7YAlbVpbgOOboUZErgg8sMPTRzYeBjDgRJN0kZxcp6i6DkXfWwsOwyi0wydXGGHdjQBshzwMypdMZ5jo/Nganaw0zJBSpIOOxHPqIJmrI60Q/ahV85jLAuWC+HyLuuAwfuXys4Szb+uamSdsCGdRybYhIdr8Yg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1677091370; bh=LXrYEQ5wYDEJz8T6nKa3qlrpUzmeRyk6revnfZKg5Ya=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=FwpI4Vj1Pwfke09NsJ8vnt8pfhB8b+SUBX4gX3R7LawWr/iBpk1J2R6PmWYKSO/eGxam/dXZcQVfrcKiQjw5b8Gi85n7S0IUoDtMViEZx+KAvSt83H/mKgsZGliEghvqdJpYSrqrb5eirs4ccKGL8r5WMufvxG3BXjGeKceQwk2BmIBSnAcxkd/ipOPeGmyOeUa+Rv90scTN5QysZ+LJHVjy0KAd7G6GffxZMd537+RtnpYtw7TRFT/NXiH1UQiVW4aWGQbuP0UG9anW974RD560Ao+3GBVFKq6KE61NE4VrYM97kJp1vcMPVKEldMgAccwl3HftBFa6JFc7Qsj18A==
X-YMail-OSG: t0WmJngVM1k.mljao18YmpdfCW2ADB4qyLjhuFnCGcYljXSPWSoN8U_bjRf7MN8
 NBBG_J1iAJFR9T6KP2pseF9qAXOZeKetoPYqvwuSb2DOTC04FSXcslgH0Diei5sVG7LFcZ1jbSKA
 lJZcfKSC6Di2KlQ5bWJaOTyzrtvpTgrSNK2masuiA5XmeH9tkbbAcX6JQoqKpr7QI9G4HgYcf7tu
 G.gK3Pweao5KICFy9IH0J9gO9cZCoKmeiyADeCUw0Lx2CO0n1T4qAgkTmPIwZxRMtoW2M8onjoNX
 AozDqa9GUpaICWfvbKyn2FxMI04uUDeMAncvlxWu37CdMCxEOx9wX4hUrS43LKxx427fKB4Bu3VB
 3u19waZEKGE3nRvfTFDG88lIscwjH4hpmYU45sL_Fsy9IE2bY8ECP9YurAXh4VPDskiYslEHgvUa
 s7U9MnA9j52xkr6XSzHD1_YXlMulhst8PodDdq9nPfkWliIYnZHdVBLztkIwH9fGWOxYYRyQaezO
 7c12Cb8pfauyYK4RvqOOQll..IUts_DiWpaEx.Cha7a27J_dKMw.pRqLTFMP51M7KfMx1clqy.pR
 gldczd5i8R3wZnnKwtvUSTmf5340lrkpvFZbkMSubHg7V2bz0T.HTvEPshF9QyifVmolHkiTn2iQ
 _AKuxQRgKiSyXxB8NWBVc6ELYunVQGu853IV8w5Rm0_eR.b7_p0PM0y3CldfWwA9G8AaJINdFs7h
 YE3LyOEdSL44VVLcLNc6Qqa51msijG7fOHyWbFpaJmoZzYVksLdjcttSb_ne1vM0Cfo9xxBW0dp1
 u.3wpAZYpkHOFubbWNhlYRDHxgjWxgE2LFfoBNMvGbQeuxDiGVUvQKiow50DP0qxZ0bt3CJDVjeR
 6ZJ8O32YcGR8_2_9Nr.YM7amBxISo8b5qBX7IX2LtUgFhvb2PTyV_j685GOap2bL2u5EmQioQBV4
 KoBnjp7GbeZ871VCvd0eiUu1yLtmlWoaw5ev.lpFx7WqHkAgLHAGfUR37El5fCmQLDjNX8T0Nbi1
 7hPOI9_P8kSDLBRTMSx8b1MDC695JGKNxiS75bk41N26RV4gGakTsSMMa14to9k7QOB7UXrFLC3m
 yEbHe8RlU_kizekLYW.1G2bWV5NaZiuUfW7eWOVcp36XTseABOcv3ynLTUM1MQ73CeoQNR9hc_Ti
 XOBOX91C5P9fWpJfnSodybKCS8gxGyD3GUK4EwzFTi.KzqjrvDPvFEAjyPIBnh1jK2iKCxkfFBWw
 sYlbL0NwEaAAb3DRAsubwayh7lfXvBfHDb7J_WK2fw2ivEUTmKYvaRlwrOeIVFV_m26YFhHS1Nww
 NPyzrPGGWHNJZiqzSUEQJBOPvahxxHlMDb8RDMLRn2RFRZlbPON.r6M_Lss8ofdbfbNpCCvQvqr3
 KDAyfV7Mbk9pg.8mpQsQa17Dl9SDtE2WpzXMWutdkg2eB6PQkH5IThCdj3nrTeeqXogU5LBTHbm6
 l9SfLFtMxZ3G.3WKhcUF88I4I6HYNireNSLgRXPes_iML.udIvwA.ekgdwHTU0HC_Z57L00BvtfC
 1wvmzvlW1U2onkbCR.5mhjjGAw012o2EVqGO4g9coCvCv6kp9Bg849wt8SU0zsmvcfmDFqcgDmy3
 8TtDgYaIa03M44PIb.4Y0s8fMi5apF1Huh4zuzxEVExdxgdBtZgdYUG2FfEbao.iASj_swW5.ZCN
 V9pm7zOkd01kmKydwKr40xRVRCYwmvLWI_iGNHM1md0AEXj9eNfCqnB619mRKENlDJfJrgZ3H2Mk
 kS4toOOICxPc5tGB2fE5UgQ.6PkKYXsh816KS1T0EOAGnrRqvqXM3rfyoIvMK5oxfWIUn7xIz05I
 o0WVGKP0aXvfpPUlN0ylDBkX6ipXriALPmZosMVcBRsQa_XCwViq85noR6qO6NYZgUf6aue5ilw2
 EydktYaqw7eq4IZh2bKBqEWPx8kxQfK1TkHYj5wTKQ9WYd1qOp1FpsaIUcIrW_ZcEDTVbFBKZ7Mp
 LDAcyXAgY1l5cz5nNXwQXpH_6ckxZyT1XLmHuvDQ6qECo7xZadSq_yaXM6mw7YkJZ1tudJ2gL_hJ
 sSTgMMyELXpLlMNBYm.SdXo4wSaK82yGHpk943eMW0BOWseODOKJfMg4Kjxy.PlA5MpchIPrcKr8
 SBdn73Ja6j54B_XxkiN0V23RNddNYD29PHRW0TITG2bV0knDnG8njEpoqF9NY2btGU.PVoXQrUcV
 _adKxKed6.Phnv30JasxrW1MVPlXGR4hf2kbDIhB1lQ.aTeVsDak8oDXl
X-Sonic-MF: <erhan14@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.bf2.yahoo.com with HTTP; Wed, 22 Feb 2023 18:42:50 +0000
Date: Wed, 22 Feb 2023 18:42:42 +0000 (UTC)
From: "Erhan Y." <erhan14@yahoo.com>
To: <openbmc@lists.ozlabs.org>
Message-ID: <1506829480.2905286.1677091362958@mail.yahoo.com>
Subject: Virtual Media service
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2905285_718700529.1677091362957"
References: <1506829480.2905286.1677091362958.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.21183 YahooMailIosMobile
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

------=_Part_2905285_718700529.1677091362957
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It seems that virtual media feature is broken in the current langdale branc=
h. It was working fine when we were working on kirkstone branch?=C2=A0Any o=
ne who has tried recently?We see that the state hook script is failing.=C2=
=A0We are using ast2500 with webui-vue.=C2=A0Thanks=C2=A0


Sent from Yahoo Mail for iPhone

------=_Part_2905285_718700529.1677091362957
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"><head><!--[if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><body>
It seems that virtual media feature is broken in the current langdale branch. It was working fine when we were working on kirkstone branch?&nbsp;<div>Any one who has tried recently?</div><div>We see that the state hook script is failing.&nbsp;</div><div>We are using ast2500 with webui-vue.&nbsp;</div><div>Thanks&nbsp;<br><br><br><a href="https://overview.mail.yahoo.com/?.src=iOS">Sent from Yahoo Mail for iPhone</a><br></div>
</body></html>
------=_Part_2905285_718700529.1677091362957--
