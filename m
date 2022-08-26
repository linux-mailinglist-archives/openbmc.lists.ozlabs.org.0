Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A0E5A2777
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 14:14:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDf0Z6K2Vz3bnY
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 22:14:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gtZE0Ud0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gtZE0Ud0;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDf082D3Dz2y2B
	for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2022 22:14:30 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id gb36so2772664ejc.10
        for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2022 05:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=B9KNVPyotIXfnLTIpBgy2v28bo6WGyoXsRFTX5/jRzw=;
        b=gtZE0Ud0Di+oMoNeunTQhz2h1ixQb+zLZs6rFVO77pkbQRZoMe8f1xKUPTLPkbx8kV
         jQGzj8/HL3Dpie99Zmzn0nH6cuBiQW5/9MKT8fyp4c6LqX7tpeB6aQUomEG98I7mce5i
         2m9wtmUF1RlxknptCaVpPYm3yPl0Cx3np5l0LURvszKknTRS+rcbiNyJOgqIy0vQ26TF
         kyfyk9pEH+Be74QLCBv4wVHAxFWjb4B+7DKr6Ua8YHfT6Dkdf37YFCI98cQ39VCeLfvu
         Nfya1LlkzO5GeitcbmGqMVkMXz5vLpmqeUuK6LlMzL7k/fOtIVYQCdsIqwnMSv+i09pg
         rqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=B9KNVPyotIXfnLTIpBgy2v28bo6WGyoXsRFTX5/jRzw=;
        b=aj9Jjm7XOpDQM1OTRyJ+vldIgeO+E1yvNaAhKUfhC5kWLhvQjfNxnM8mHOo/1OMxJT
         Ud5nZ3rgEzw1cbru2FePRtJ3fTe6JRAPPjxAzcRmTmq/mxwizbqEs2o2RKqoC75/tSPt
         jhb4Wa8K66SgaJv85ncbIRtAJ5Ub1a9jyZkau4srjb5F8yU21lo6FDSTJN552TiuWbhI
         A5yzYNtHRzjXinjVOdLL8aVgdeNoCBqhx641Zxf2eTyMgtXaJv/utEk1VYQaRNhX01cy
         nQIcR+CSKig2dTcMroOEEDMlDxwkRiCqUfCVvgTbnjd4tCek7AY3NcVZ8DfwNsIxMKaC
         VW2w==
X-Gm-Message-State: ACgBeo2CufHmOb94FIT67zGIpfat6dGULJGTqm/zSWhgui7XiEofWP3E
	+lKOZgML8Ft9S/SaTpO+LbRhN8hd7qquOT8bHqSyMJxo
X-Google-Smtp-Source: AA6agR7qoH6udxwVU4guKX0453kqkQH7egx+b1Lm/mHB2HtNAI+v2e6ByCZHwRDh0OLHQ+5LY8hXVLHU6SoRRJrqxUY=
X-Received: by 2002:a17:907:a061:b0:73d:5429:b5ad with SMTP id
 ia1-20020a170907a06100b0073d5429b5admr5259815ejc.612.1661516062579; Fri, 26
 Aug 2022 05:14:22 -0700 (PDT)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Fri, 26 Aug 2022 22:12:33 +0530
Message-ID: <CAE33tLF5KTW8-gCq9bn_AsKmfaMUrV9faERzWQzL6s38F2O-DA@mail.gmail.com>
Subject: Read CPU memory from BMC.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000b2de5005e723da8d"
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

--000000000000b2de5005e723da8d
Content-Type: text/plain; charset="UTF-8"

Hello Team,

Is it possible to read CPU memory space from the BMC?
If PCIe connection is available from BMC to the chipset, can we do DMA from
BMC ?


Thanks and Regards,

Akash

--000000000000b2de5005e723da8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Team,<div><br></div><div>Is it possible to read CPU =
memory space from the BMC?</div><div>If PCIe connection is available from B=
MC to the chipset, can we do DMA from BMC ?</div><div><br></div><div><br></=
div><div>Thanks and Regards,</div><div><br></div><div>Akash</div></div>

--000000000000b2de5005e723da8d--
