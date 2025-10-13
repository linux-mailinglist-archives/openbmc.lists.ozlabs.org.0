Return-Path: <openbmc+bounces-734-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 568F2BD2D3A
	for <lists+openbmc@lfdr.de>; Mon, 13 Oct 2025 13:44:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clb9r6HbSz30P3;
	Mon, 13 Oct 2025 22:44:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760355888;
	cv=none; b=Yqa0xi5C96mrc1q6D3tEFDuSbti3NlVrowJ5fzcF9xCRTQjfskVnlmzk09Tjcl/BN9U2syTaAqSx9bN9hzbsMKnxMnKWosHUmyEIHAcbeN6EyIR4rYWMxy6wq7CtM6zOnCYMeaGImkRdohdfZf9NdiAxSDhAPOpTNvsCZ3swUGF2oqffG5FBuqCF+iHzeQ8ZEG81YVDMtVEOHBD68ACTLB9q8Oiumn+VcapCK1HvlqUHWkR5wf4UJreCoFStZ9SmSAAj7x09tVnZ3HayRRKG3Arppbi7Ew+W9UaKymVulLK1NdT8ymszsTEWCDjPwg+JOeN0QNJqOmxDjcP8DyHB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760355888; c=relaxed/relaxed;
	bh=1K17b/K8yQXfwqlp4oNmjpZOU5mgfldRYoFZRQe1+Os=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hG2KR8NKK1C1gqa8znnf2EiVQJLpCbEkLvvqDZBEJL2bnngzSBdjH0/xsRDZFsLPNhYP/ggaq5ttia8IvThXYU1iapjNuOryJ60Y84ndmDEjDfBg26OEYHZqDfiFAyU88J4gQaXypbFQ0ntnSBvzMea4jTO+v7R1O0YBJA5CWPEYF+pVu239aZ0Hw6GatykcWV6MrUv+y+mGTIhXq1TvzMnvf/zaMO3Th0E1gKEHWG7TUOrTS/q1vi796aGUDomFzPvZ6BD4AM05g//KmMLwoPGLCmbUpNU0fxYeVw0sMvLCP5RRs0SbILjqcZbLv8Fh9ZHUaBZkvVAxu92+h10qBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k4KfnYLi; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k4KfnYLi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clb9q20lLz2xQ6
	for <openbmc@lists.ozlabs.org>; Mon, 13 Oct 2025 22:44:46 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5507876e87.1
        for <openbmc@lists.ozlabs.org>; Mon, 13 Oct 2025 04:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760355880; x=1760960680; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1K17b/K8yQXfwqlp4oNmjpZOU5mgfldRYoFZRQe1+Os=;
        b=k4KfnYLir9IdOV+cq5JmLWdqxt4rP5t78tMMi26uGxwqH9GOWpiITgFKj9WYCpE8ZG
         M83+30o/P6kUtHMq8QE36VoRvmqH/nATMBcE4PD6j4GBQRDyVm/f9ssVtMqtwkWM4cpi
         /jUY3BFIMin4OJOkBmg1sM6pdYTSxmRpEVbjj3Hxu7jAi7A4SntJWmA5yddvYMUz3v0g
         olhVewjtFbVs0lhiX0yvebNbZSZQBmODEHI155PhW+FXSN5jVwV/KlxHhf4+gcjS+sx4
         bj/xqF1WosL4WpqIls0VbXdrMO/fqGuBRZklxIoTxNfZs7JQxrBaQS8d8fOYu94np4g/
         sEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760355880; x=1760960680;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1K17b/K8yQXfwqlp4oNmjpZOU5mgfldRYoFZRQe1+Os=;
        b=WlmS9sY5ZQkzcZZ4Pa1N1dMZuYU+hjtd9vt8UT6bLQdvbOleczku3jHztrRZsYv4Sv
         E9Ty4SxRnMgF3RE4Z6L9KPyP3yi46phIjACDXFT5Ta3lOLfeDJ16QZQOK4Ay6eMltgWg
         FxuN5FaYSAWEMl4nets8zv6FyUklfq0MVpWtyU5ie4ZfDuN1DdL/pWVP2IEWyS4nFu1f
         ukjpi720y9hB0ODSI7kSyov2U1qSj3jeRSeg25P0nWzOsrCk1x/gcE6EViH9bND01Pi/
         0L42uq1hHwgbvzO5gI+EqTd9iy1cdyV7NTwxcappQB05w2Zb9MbKhsk+jzYFrwpM3qi1
         loKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfoTejMw3qg2wTolWCxQxu68FkdggDv4r8Qx+WI1FLccrxu8K0zzBwAWS3WpSNzY9Xf+rBWxPf@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxQPbxFt3HndLBGiXFO31fO9+Z19XeTPOUpsiW0fXf1FOojmrXT
	W/Dv1RN2LlIeMCXEmWaNbsH72mlG/LzqamJDY0Zv0ugskRRuEM0v1dt8
X-Gm-Gg: ASbGncu2LsElf12eDykImqIri04nLTsM8TtGaZKFM82+7ql12aZpwJfPrS7zIZ3CVu8
	EarzSdjc5fpKLpJJ9oxrAZul3CRXtckchS2XvgHB8vihfth9OTCeA4SZO1VJGKdpbAbxg30AiQd
	lrhIRS7Gnxk1y1K7v19EohI71ZGHCOJ9J51e/O+Rv8LXhUcUNxblLpxYQ2O6rtS4aVLlrJPzoiR
	UCQQ87JA4YuXE/Z1IH+Gj4OwKgJneiiMDKfhWiXZAOGqvjU20oxgj4Fz0dKO+9fviu65p+yMsfT
	YCt9euDXhXjLburYC5sXCkXvvd2XR+CeG7Gr6ZvtpJFHoaw6jAznvVx5+9GbBsyvqKvclYFRYsS
	mY05RfNx8pCNoJqaey7o8+mizQ7ISrT5jf4Mfq6qKzpab
X-Google-Smtp-Source: AGHT+IE3d16akBxeLLNasuVPZAcPS6yQwFuxf/4sTLdfKlAN6I/lYxBnzcpDd444DNztoAVGRjcn2g==
X-Received: by 2002:a05:6512:682:b0:57e:3d46:d6bc with SMTP id 2adb3069b0e04-5906d773518mr4914882e87.1.1760355880260;
        Mon, 13 Oct 2025 04:44:40 -0700 (PDT)
Received: from [192.168.1.161] ([81.200.23.195])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f26sm4063733e87.9.2025.10.13.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 04:44:39 -0700 (PDT)
Message-ID: <9badd4e53ddb6166d0aa196da978bd70f61642de.camel@gmail.com>
Subject: Re: [PATCH 2/3] hwmon: (peci/dimmtemp) add Intel Emerald Rapids
 platform support
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>, Guenter Roeck	
 <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org
Date: Mon, 13 Oct 2025 14:44:34 +0300
In-Reply-To: <0ede72a9-4555-4e4d-959d-3a505b6598ee@molgen.mpg.de>
References: <20251006215321.5036-1-fr0st61te@gmail.com>
	 <20251006215321.5036-3-fr0st61te@gmail.com>
	 <0ede72a9-4555-4e4d-959d-3a505b6598ee@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 2025-10-07 at 10:26 +0200, Paul Menzel wrote:
> Dear Ivan,
>=20
>=20
> Thank you for your patch.
>=20
> Am 06.10.25 um 23:53 schrieb Ivan Mikhaylov:
> > Extend the functionality of hwmon (peci/dimmtemp) for Emerald
> > Rapids
> > platform.
> >=20
> > The patch has been tested on a 5S system with 16 DIMMs installed.
>=20
> What is 5S? 5 sockets? (Probably not.)

Paul, thank your for review and sorry for late reply.
5S - Intel 5 Series/5th Gen

>=20
> > Verified read of DIMM temperature thresholds & temperature.
>=20
> Also paste the output?
>=20

root@bmc:/sys/bus/peci# ls -l devices/0-30/
lrwxrwxrwx    1 root     root             0 Oct 13 10:51 driver ->
../../../../../../../bus/peci/drivers/peci-cpu
drwxr-xr-x    4 root     root             0 Oct 13 10:51
peci_cpu.cputemp.emr.48
drwxr-xr-x    4 root     root             0 Oct 13 10:51
peci_cpu.dimmtemp.emr.48
drwxr-xr-x    2 root     root             0 Oct 13 10:51 power
--w-------    1 root     root          4096 Oct 13 10:51 remove
lrwxrwxrwx    1 root     root             0 Oct 13 10:51 subsystem ->
../../../../../../../bus/peci
-rw-r--r--    1 root     root          4096 Oct 13 10:51 uevent
root@bmc:/sys/bus/peci# ls -l devices/0-31/
lrwxrwxrwx    1 root     root             0 Oct 13 10:51 driver ->
../../../../../../../bus/peci/drivers/peci-cpu
drwxr-xr-x    4 root     root             0 Oct 13 10:51
peci_cpu.cputemp.emr.49
drwxr-xr-x    4 root     root             0 Oct 13 10:51
peci_cpu.dimmtemp.emr.49
drwxr-xr-x    2 root     root             0 Oct 13 10:51 power
--w-------    1 root     root          4096 Oct 13 10:51 remove
lrwxrwxrwx    1 root     root             0 Oct 13 10:51 subsystem ->
../../../../../../../bus/peci
-rw-r--r--    1 root     root          4096 Oct 13 10:51 uevent

root@bmc:/sys/class/hwmon/hwmon3# ls
device        of_node       subsystem     temp11_input  temp11_max  =20
temp13_input  temp13_max    temp15_input  temp15_max    temp1_input =20
temp1_max     temp3_input   temp3_max     temp5_input   temp5_max   =20
temp7_input   temp7_max     temp9_input   temp9_max
name          power         temp11_crit   temp11_label  temp13_crit =20
temp13_label  temp15_crit   temp15_label  temp1_crit    temp1_label =20
temp3_crit    temp3_label   temp5_crit    temp5_label   temp7_crit  =20
temp7_label   temp9_crit    temp9_label   uevent

root@bmc:/sys/class/hwmon/hwmon5# ls
device        of_node       subsystem     temp11_input  temp11_max  =20
temp13_input  temp13_max    temp15_input  temp15_max    temp1_input =20
temp1_max     temp3_input   temp3_max     temp5_input   temp5_max   =20
temp7_input   temp7_max     temp9_input   temp9_max
name          power         temp11_crit   temp11_label  temp13_crit =20
temp13_label  temp15_crit   temp15_label  temp1_crit    temp1_label =20
temp3_crit    temp3_label   temp5_crit    temp5_label   temp7_crit  =20
temp7_label   temp9_crit    temp9_label   uevent

root@bmc:/sys/class/hwmon/hwmon3# cat temp*
95000
35000
DIMM F1
93000
95000
35000
DIMM G1
93000
95000
34000
DIMM H1
93000
95000
35000
DIMM A1
93000
95000
36000
DIMM B1
93000
95000
36000
DIMM C1
93000
95000
36000
DIMM D1
93000
95000
36000

root@bmc:/sys/class/hwmon/hwmon5# cat temp*
95000
34000
DIMM F1
93000
95000
34000
DIMM G1
93000
95000
35000
DIMM H1
93000
95000
36000
DIMM A1
93000
95000
35000
DIMM B1
93000
95000
35000
DIMM C1
93000
95000
35000
DIMM D1
93000
95000
35000
DIMM E1
93000

Values around ~35 is temp*_input and thresholds as 93,95 for max and
crit temepratures plus temp*_label.

Guenter, I saw that you already applied other two patches, need I
resubmit series with updated info of commit for this one or just this
one?
>=20

