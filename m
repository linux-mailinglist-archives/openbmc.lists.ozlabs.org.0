Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A98205B31C3
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 10:33:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP8Qh2h1zz3bk4
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 18:33:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cBGqXto4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cBGqXto4;
	dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP8QD3Z66z309Y
	for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2022 18:33:07 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id bx38so950692ljb.10
        for <openbmc@lists.ozlabs.org>; Fri, 09 Sep 2022 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=EwWoffURr0jFUJLKOzbqjV8alDhGczDizPPd826Qg7o=;
        b=cBGqXto44cNhYFbs44hAp7djWByu1/Fb3MBY/A924jCnLFIzMynhqhAy3ETuASxyJE
         CdzxY6dXsc+otD21C46sp5i4vupcPHfSZri16mfK53zUIl8j/KmtL7I2wdPFRax2ZKKo
         ToQ6T4Gx9nqFNtWpIqmQJy+LYCoiQKmYl2YVEpKmRbStJIxFSobsvlu/4ojSBzkwsFjn
         lVWpTX8xiv1XJTYP1/Y0cGwLP+Rp5Jbk+U4z79AEl20V1A8vERAHApUghKS2KA0LgVee
         Bdf7MvJbNnDwWT08MItDsJtEfTwqvhxQaOMha+2EZAKn2GQtNyFmuY3EEnSqmAylvFyq
         l/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=EwWoffURr0jFUJLKOzbqjV8alDhGczDizPPd826Qg7o=;
        b=d7tKQrTpy9OzndO+vQthvyhVTAX8S3MWBs8tZKeKOsq2wgUs+5SRBS0nATgYjskVDn
         d/MfdVI8G4udwwO64PlgwnlrjCmLJDJYOmlYBDZyS3ep28at4cRFN2OU8gWonhHJE4mm
         IGzump7QXYYspJqyW/RiOe672Xw3VJYlT8EaO3SRT2988olF79T1UBTaPsVAY4RrO6nt
         P4qqiubWJ5dKsaagqdAvSOIMAvXlffGdcKYUoEmkd/oO4szzHi5+eFqBl5c/VFRZqI/U
         F7Qdo2/BkAjVhKkxdG38+YW91+vgfXEvH7y1TtYmBqA66ZZHMZd5raIr6oeY3sZdSB05
         sCFg==
X-Gm-Message-State: ACgBeo1lnu4lA7aE4J/3R7b9703NyrKPu8KISA/qCajBFD5Xovm4METT
	zsCO56FeDRxTDpO+KlDdtB1rLSvKHDM=
X-Google-Smtp-Source: AA6agR6tgFk7t3YlbH7ADGkR8nrmjNEccggEq70BQw0hr3jIIjxoXf2RT1aodQsgvvMV7QEH61k7WA==
X-Received: by 2002:a2e:a98b:0:b0:25f:d9e9:588d with SMTP id x11-20020a2ea98b000000b0025fd9e9588dmr3725866ljq.205.1662712383125;
        Fri, 09 Sep 2022 01:33:03 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id a7-20020ac25e67000000b00498f51af149sm171337lfr.308.2022.09.09.01.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 01:33:02 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 2898WxW3020337;
	Fri, 9 Sep 2022 11:33:00 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 2898WwJG020336;
	Fri, 9 Sep 2022 11:32:58 +0300
Date: Fri, 9 Sep 2022 11:32:58 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: SATA hotplug notifications for BMC inventory updates
Message-ID: <Yxr6OmHDrzQVSaYr@home.paul.comp>
References: <YxXZeFQhJWDSHSVf@home.paul.comp>
 <2cdb6ea6-fc85-9835-d410-01195148a3eb@intel.com>
 <Yxin03RwpUvVPsAy@home.paul.comp>
 <2f56b77e-a7a2-3577-c868-90fa6226f483@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f56b77e-a7a2-3577-c868-90fa6226f483@intel.com>
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

On Wed, Sep 07, 2022 at 07:36:08AM -0700, Johnathan Mantey wrote:
>>> RAID solutions are outside of scope for the Intel BMC.
>>
>> Intel VROC too? Why? We'd be willing to contribute some development
>> effort into bringing RAID monitoring and management to OpenBMC,
>> wouldn't the community benefit from that? Many other vendors
>> currently offer this feature, why shouldn't OpenBMC? The problem
>> seems to be with the documentation availability; can you please
>> tell where the relevant hardware and protocols are described?
> 
> Paul, this question now crosses a demarcation line. As a contract
> worker I'm not comfortable discussing the topics you raise in that
> paragraph.

I'm not fluent in business slang so I take it you mean the feature
might be nice but Intel doesn't want the OpenBMC community to have
it. Well, too bad.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
