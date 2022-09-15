Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 598F35B9E1C
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 17:05:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MT0rR595qz3bkl
	for <lists+openbmc@lfdr.de>; Fri, 16 Sep 2022 01:05:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dUdvHsM0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dUdvHsM0;
	dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MT0qy0mYNz2xJD
	for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2022 01:05:17 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id a21so6450798ljq.7
        for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2022 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=KrMOMSoAx+6s+xHyFyZE//WnQrsueNlEf69eU+DK7ZM=;
        b=dUdvHsM00x9jGXPw2NCeivZQzsbupYObv0uhJnQgWGxXMtDfSBI59g/wut8dq4ETZK
         orQszUVNoghirKRpNTUeXJf8ZeLveXy29xaEScg/i6Z0WoNCNRsUSgKuxhcTg3C5A3OI
         +vr7j2iK0mjIT6jCBGIeGEdtf1ZQR7+K9u+cP43swc2px0+UssKwvn7uoiXlh5qAIVNW
         I2ebSFUIrjjWXrhlfIa1mb203H1+yiBWSk9SGXvpkRqFmdCR6mi5qZtmEIaxoIqrR+bf
         A7FfsNxoLraHWMPewc2RrpnxB5fP2SBp7KLki+SCxqEsTXr1CKOUl1mnEkrbn7sNxEgh
         IDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=KrMOMSoAx+6s+xHyFyZE//WnQrsueNlEf69eU+DK7ZM=;
        b=XIFTlf8iWUBNZ3BzzkCa0Nl01t4vAGPaonHIl1294qNCDS3j7cCKs6Az9RApsLdesv
         mM39KwqxIe7VJVyERbdcyeYNetpbT/msvuCe68Mjcf4hAmXDlp9NoxvI+ahv1p3w9YtF
         8DiGv1hOd7NCsaWK7Js+t0ivciAPYMLslcYUmacN0eI6j8rdblA7nqe14kpRo5pUwyjX
         9K7bOQW6ku8RRUMjdNm6ihCG+kKgniGI9BN4DMtyrqpLENrJjXdnDmSypdrJr6CJ6FYm
         Fq76Gv/aED3pQfOMKxWuz9zpHgQ2elhOt2lg39h5vGQN0w6sAzlez0sGAXxNbAWm6u7h
         3zWQ==
X-Gm-Message-State: ACrzQf3pc87aX9DdhZ1LXRBvZKBjD50toACpuICIW2TKcN3FhHYZGuxk
	DpSdPIkoZgMVesQuKd4/pfg=
X-Google-Smtp-Source: AMsMyM4QIJk3UMyJTjNusHD91hpUvRMcoX2DUCzi0vGh8IGcTjIBhunYINHfScNcSa7zZApRGC2b9A==
X-Received: by 2002:a2e:a0d4:0:b0:26b:ee65:261a with SMTP id f20-20020a2ea0d4000000b0026bee65261amr56423ljm.83.1663254310437;
        Thu, 15 Sep 2022 08:05:10 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id g7-20020a056512118700b0048a921664e8sm3016402lfr.37.2022.09.15.08.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 08:05:09 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 28FF56Oh021860;
	Thu, 15 Sep 2022 18:05:07 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 28FF55xY021859;
	Thu, 15 Sep 2022 18:05:05 +0300
Date: Thu, 15 Sep 2022 18:05:05 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: SATA hotplug notifications for BMC inventory updates
Message-ID: <YyM/IcDAWX4l1r5U@home.paul.comp>
References: <YxXZeFQhJWDSHSVf@home.paul.comp>
 <2cdb6ea6-fc85-9835-d410-01195148a3eb@intel.com>
 <Yxin03RwpUvVPsAy@home.paul.comp>
 <2f56b77e-a7a2-3577-c868-90fa6226f483@intel.com>
 <Yxr6OmHDrzQVSaYr@home.paul.comp>
 <89592b7f-784c-d94c-8a81-57cb49a3bcce@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89592b7f-784c-d94c-8a81-57cb49a3bcce@intel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Johnathan,

On Fri, Sep 09, 2022 at 07:12:21AM -0700, Johnathan Mantey wrote:
> What I'm trying to convey is that as a contract worker I have access to some
> information I may not be authorized to divulge. This is a public forum, and I
> need to tread carefully so that I don't divulge information that impacts my
> employment.

Thank you for the reply, it's now all pretty clear to me, much
appreciated.

> The starting point for this conversation was HDD insertion/removal event
> detection.
> Which then evolved to HDD MFR/Model Num access.

Manufacturer, model and serial number are all needed for proper
inventory. I mentioned hotplug events because cold plug is not
problematic at all: UEFI can enumerate all the devices and send
information via IPMB to BMC on startup.

> Which then evolved into RAID controllers.

That also follows naturally as when the storage is attached to a RAID
controller, or an HBA in non-RAID mode, or handled by Intel VROC the
BMC might need to communicate with them to show accurate
inventory. And if we're talking to a controller anyway it's nice to
implement RAID management as well. And I know that's working with
other BMCs, so the hardware connections must be there already, we just
need to write software to make use of them.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
