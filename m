Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EAF5AD134
	for <lists+openbmc@lfdr.de>; Mon,  5 Sep 2022 13:12:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLm7s6XjDz305v
	for <lists+openbmc@lfdr.de>; Mon,  5 Sep 2022 21:12:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AYGK1LTe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AYGK1LTe;
	dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLm7T1M8Sz2xFx
	for <openbmc@lists.ozlabs.org>; Mon,  5 Sep 2022 21:12:04 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id bq23so12636948lfb.7
        for <openbmc@lists.ozlabs.org>; Mon, 05 Sep 2022 04:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date;
        bh=gwB1XRWE7HOYl5w+48xuIzlqBdo946pb4l+N5Z7XAqc=;
        b=AYGK1LTebl04zePj+KkTyYFlfhokcI94QPJkXiM5D8o71wkcNOPUXfJYlYOb7SqgMT
         lL8awbJaf0qPWeJ/DiJgdsEYqANop/XHPsla5PvatSjSkeXMmtQ0WDgh0ouXO6/1WQmc
         RMwEWil7Xjwe7KIuGwWHLVHcslEaVgc0GEjmiBnXtPsChgS9i6JnObe6/DOSHCOdVHir
         pfUco9Rxfo5wxzUnGZRYiH3I4Nz+VThfP4dVSG2NZAihm0LLkxtT3EdUcGDu5j9QmK5h
         mAWpLihfY55hKcAfa9bbAWuR++i1hAVnljWwEZUTT5465coo9UMs1aFQa3x3Gp5HQ476
         20Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=gwB1XRWE7HOYl5w+48xuIzlqBdo946pb4l+N5Z7XAqc=;
        b=eEVblIckRZHIOrpbM+tzfSl9P+SSHd1/IPiLXRbwfAOOC+3niqrAYXpyWd2E071amI
         Q5Cq/dmxfhYhTNPl+/Mv5zjCOIMSEMspmmNQkjCTTMm/g6Jjlrr5mWnU/smnFLuj0BqL
         2UfX8C3TzPWUkPWni18cC9VSz5momRdau8X8YW9doKitNI9Ff3nQffNWPRiVYSaSOabL
         8BdMYHSZJMgU2p7e8AbktjaWOLfH0xWaITTraF5OJ0chVx4+LL8knAMulSU2lFhFIQBC
         4YOMOOddUHy1UvQsTqwhhN65CUbxJJNY6HBrjTjJc29zPhrVoXwyyGgysSFWAeDSreHi
         eE1Q==
X-Gm-Message-State: ACgBeo1L3MMAVRWbiDy909VzCUoHy4VmGfruyKC3QU8i5LilwxcgiI8u
	BknfRsMi1ozVv8uHVN7nTKRU+yc5HwU=
X-Google-Smtp-Source: AA6agR6s2UPvl5vLvaX+H7nyCdqFOA9gtJxHrfkvEzwbi/neezS7G18bsFDbWRQ0GZJUFLvZ/r8r5Q==
X-Received: by 2002:a05:6512:108f:b0:494:7299:7152 with SMTP id j15-20020a056512108f00b0049472997152mr11341835lfg.514.1662376316536;
        Mon, 05 Sep 2022 04:11:56 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id f4-20020a05651c02c400b00261d66b22a3sm1368362ljo.29.2022.09.05.04.11.55
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 04:11:56 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 285BBq0g011707
	for <openbmc@lists.ozlabs.org>; Mon, 5 Sep 2022 14:11:54 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 285BBqj3011706
	for openbmc@lists.ozlabs.org; Mon, 5 Sep 2022 14:11:52 +0300
Date: Mon, 5 Sep 2022 14:11:52 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: SATA hotplug notifications for BMC inventory updates
Message-ID: <YxXZeFQhJWDSHSVf@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi,

An OCP Tioga Pass platform features up to 4 drive bays for SATA
storage accessible from the front and fully hot-pluggable. The
backplane is usually connected directly to Intel C620 PCH (aka
Lewisburg).

It would be nice to have information about the currently attached
devices (model and serial number) available in BMC inventory but what
are the ways to get this information?

Is it possible there's some additional module in the all-mighty ME
that can supply BMC with the current state of PCH SATA controller? Or
is there some other sensible mechanism other than talking to UEFI on
startup (which would mean BMC is showing stale and thus misleading
data till the next reboot)?

Even though the question is quite specific we'd appreciate any related
insights on the topic; there must be some side-channels to RAID
controllers and such for BMC to be obtaining essential information but
so far I wasn't able to find any documentation about this.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
