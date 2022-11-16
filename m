Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E00562BF77
	for <lists+openbmc@lfdr.de>; Wed, 16 Nov 2022 14:28:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC3lx2NWDz3cFZ
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 00:28:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ibRkRF/o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com; envelope-from=sharad.openbmc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ibRkRF/o;
	dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC3lK1gdVz3c6k
	for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2022 00:28:12 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id a14so29937458wru.5
        for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2022 05:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2itWadDfmh896pCO3OTTYmOPKaYS+d8gbvUdJ7zRSzE=;
        b=ibRkRF/oShgj8GFr0rHh5bkby7aKmwMuxi8pMTpmiZpexEtuTmJzm9RTCsnJtjI+hC
         BBKv4E/IG6cuK0Nx3m3O6FgU2uNH8Gl8t/Lfe/Ic1CYkTmNJl7EsM6Eqx2lEiBEwfd5g
         BCQadDVHq+c0RR/JFo2AuXE7akNnv7LDssJczVQgQT9LACAOmyIr9FqVe2u2Nz+2+r+m
         h+keqvCZGqsnHi3K5JdmKrCtnZ6fid+NyjR6ftvp07tB3d0MwxFqJRkheQ9cBosTTJTb
         6E9tBQ4RQnxdt8X0i1+r+8WcwiN+n2FWO45pwU11hrDFJqtP/bt6+FPJ79rG6ANhii57
         pMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2itWadDfmh896pCO3OTTYmOPKaYS+d8gbvUdJ7zRSzE=;
        b=EIsJPoUBS0Sl0eECZvjM04PC0uJvnpGRaTenagq1lcFplNx9ykLSbqCcBpSeBPBWEN
         A8GWV9Xp374HUU8bovPNdKfM7dNGMEUMCuEgaMH6gYGoDqMb6kypz3iQhWgj4imYjBD/
         JeoDn/ESFpRC8WqD5vxEFeQ8Updzy3o+p0g/PA+j7A1Tl1Vj5icPCHvuEkXWta7W239h
         MV/Jm/UXFUCOFHD11qK3A+NPQOdAbXfwi4ZEwM8AEh7WJQVMmeAZwJAJlgGM28daR274
         RcBWodD41DaVWntWh2P+QNwZoffkwzrH4VDKWnu5AFJr0TYJAWEC3/zFtxXaJi9FTbhG
         Owng==
X-Gm-Message-State: ANoB5pmhedvOOZ+LKh23O7zGgKWZ/qa8IVL6NlTr1wsnckjLYJOf5Gb0
	LwZJP+TiwfqAjqrfNnrwaPJz21XfRhRslrR9fn/bQT0JSI0=
X-Google-Smtp-Source: AA0mqf43sLIT+Pon5vi8QdjOINllkFDYpLd7kNV+gHDVZcuoM2NFGitKR3Mx9pjKwg2ut1FYtWE35JbLT4UKbyYUC58=
X-Received: by 2002:a5d:4846:0:b0:236:5aa8:a07e with SMTP id
 n6-20020a5d4846000000b002365aa8a07emr14314389wrs.437.1668605287586; Wed, 16
 Nov 2022 05:28:07 -0800 (PST)
MIME-Version: 1.0
From: sharad yadav <sharad.openbmc@gmail.com>
Date: Wed, 16 Nov 2022 18:57:56 +0530
Message-ID: <CA+H48BRsTM4B_MHreMZG+_9abbjp5G2jcxmiMwqiPGrFytWWTg@mail.gmail.com>
Subject: Performance: BMCWEB prioritizing URI response in multiple redfish
 clients environment
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="0000000000006fddf405ed9671eb"
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

--0000000000006fddf405ed9671eb
Content-Type: text/plain; charset="UTF-8"

Hi All,

We are facing a delay(till 6seconds) in bmcweb URIs responses when there
are multiple clients(4 in our case) performing GET requests in parallel on
different URIs.
We have a very important telemetry URI, used for thermal monitoring. On
standalone, telemetry URI response is within 200ms.
But with multiple clients, telemetry URI response reaches till 6seconds.

Can we get help on how we can assign priority to our telemetry URI over
other URIs in bmcweb?

Thanks,
Sharad

--0000000000006fddf405ed9671eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>We are facing a delay(till 6sec=
onds) in bmcweb=C2=A0URIs responses when there are multiple clients(4 in ou=
r case) performing GET requests in parallel on different URIs.</div><div>We=
 have a very important telemetry URI, used for thermal monitoring. On stand=
alone, telemetry URI response is within 200ms.<br></div><div>But with=C2=A0=
multiple=C2=A0clients, telemetry URI response reaches till 6seconds.</div><=
div><br></div><div>Can we get help on how we can assign priority to our tel=
emetry URI over other URIs in bmcweb?</div><div><br></div><div>Thanks,</div=
><div>Sharad</div><div><br></div><div><br></div><div><br></div><div><br></d=
iv><div><br></div><div><br></div></div>

--0000000000006fddf405ed9671eb--
