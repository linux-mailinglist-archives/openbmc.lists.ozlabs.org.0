Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F205999B8
	for <lists+openbmc@lfdr.de>; Fri, 19 Aug 2022 12:25:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8Hvg5XX2z3ds6
	for <lists+openbmc@lfdr.de>; Fri, 19 Aug 2022 20:25:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g0/4xZzz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g0/4xZzz;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8HvH53v0z2xn8
	for <openbmc@lists.ozlabs.org>; Fri, 19 Aug 2022 20:25:13 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id u9so5515856lfg.11
        for <openbmc@lists.ozlabs.org>; Fri, 19 Aug 2022 03:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=9l5nu9AFVyE3DFRv1luZaPgseXmnoPQEF2CyWixhB1o=;
        b=g0/4xZzzSJLCaFAjTQtAu76Ohb35+zPGWv0i8z8hlO9X+AvIyB2/qS/6hs3URcWDWm
         4JY4CL9QBON5G1RW0NXL0s4NjTkfW2uvNoWY15ojKHiNOmoIejsVQ+wIaZ/TuDtWgwuF
         +IEO2y7eVfZDzf2hKk8O0JxGlicpBVVXP3TOemOJVsmcDb1v1CVaPCjetKwat2is1dX0
         AliM0m8M3OIL5lrhLT3+HSOgN9KYoaeQkM64ljcXGYtyoiks8uLDR0y5Ry0EhrKe4Pl0
         AYWV90PEEYiaVR5/aCyixvS5D5rsTh5rN2g1OzrCmX3oRW3ik7Cqf36T60+cOKn0wkUV
         dcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=9l5nu9AFVyE3DFRv1luZaPgseXmnoPQEF2CyWixhB1o=;
        b=5RwJDqQaPp9eEKuTfHHjWSnMzeBOhomeCZt8GidH3w1TaAByKBOu7XmyffVovRHoYz
         5Ormr+jfPc7/yp15SghA1THpBS9XZ9uX7uWDrzGjy/sRxCUCS84Wp6jFuKsIoUDWP4Xj
         S1QFFSxvxQ0hhiPDio59TNAMsZDzpNyLVEG0l4HdCLf6dSa3ld8zmvjUHbYwtJUXAfgL
         6c+TQqtgJ0HjsmWQ93AFpqJwFOB991duWcL3L4SFfKoD9Tc1u3xcTenG6DMWP7rQbh4z
         3DPmjMyDPmqNKfGI5u/zOan9Q1v6XJdm5SJhPWiMR/p392LG0K0dbPA7sbsSbM48oZ8o
         /W+w==
X-Gm-Message-State: ACgBeo2uiBR3E7AAezmOfwrwaViFfeA1a9PA2xP2Ny6c1MPgggL6iTRE
	TqVk2N3jDwSM2nKjms2eiwe5ZAtOyDI=
X-Google-Smtp-Source: AA6agR5tueW7G67DyhN7+2yEuVd0+d/PkYMTa0am/iLZa3fmsxwxa5q1bfiroyROEdqrb6C93oaPHA==
X-Received: by 2002:a05:6512:304b:b0:48b:4a82:4d3f with SMTP id b11-20020a056512304b00b0048b4a824d3fmr2344264lfb.314.1660904706314;
        Fri, 19 Aug 2022 03:25:06 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id u5-20020a05651c130500b0025fdf9eec1dsm557213lja.111.2022.08.19.03.25.05
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 03:25:05 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 27JAP2ih030416
	for <openbmc@lists.ozlabs.org>; Fri, 19 Aug 2022 13:25:03 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 27JAP2Jw030415
	for openbmc@lists.ozlabs.org; Fri, 19 Aug 2022 13:25:02 +0300
Date: Fri, 19 Aug 2022 13:25:02 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: Re: IPMI sensor names with VMware ESXi. Found the answers.
Message-ID: <Yv9k/oaasWmWg5je@home.paul.comp>
References: <Yt6YhAPcHfmEFtUz@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yt6YhAPcHfmEFtUz@home.paul.comp>
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

Hello,

I've figured out the issues and the fixes, so answering myself here to
get it recorded in the mailing list thread and indexed by the search
engines.

On Mon, Jul 25, 2022 at 04:20:04PM +0300, Paul Fertser wrote:
> We're facing what might be an interoperability issue between OpenBMC
> sensors exposed via IPMI to the host system and VMware ESXi (version
> 7.0u2).
...
> "Unspecified 1" for all the IPMI sensors "captions".

Long story short, I asked ever-helpful neotic on #vmware IRC channel
and he suggested to take a look at libipmi-4.5 (OpenSolaris heritage)
from their "open source" bundle. Writing a test app based on that
reproduced the problem, so debugging became straightforward.

In my testing the "Unspecified" part of the name was the textual
representation of Entity Id (0 by default), 1 was the Entity
Instance. I documented ways to make it specified with intel-ipmi-oem
(or the new dbus-sdr phosphor-host-ipmid support) in another
mail[0]. When using the static yaml sensors description for
phosphor-host-ipmid "entityID" and "entityInstance" keys need to be
set for each sensor individually.

The actual names are ignored as they're transmitted using what IPMI
specification calls a "Unicode" encoding, in this case libipmi returns
an empty string. I fixed [1] it for intel-ipmi-oem by using "8-bit
ASCII + Latin 1" which makes the library copy strings verbatim. If
this is approved I'll send the corresponding change to
phosphor-host-ipmid (to fix both dbus-sdr and static sensorhandler).

[0] https://lists.ozlabs.org/pipermail/openbmc/2022-August/031723.html
[1] https://gerrit.openbmc.org/c/openbmc/intel-ipmi-oem/+/56626

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
