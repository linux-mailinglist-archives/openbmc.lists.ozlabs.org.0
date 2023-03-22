Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9906C4B76
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 14:15:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhTVP1gVhz3ccw
	for <lists+openbmc@lfdr.de>; Thu, 23 Mar 2023 00:15:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gSJR3q5A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gSJR3q5A;
	dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhTTm262bz30QQ
	for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2023 00:14:51 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id h9so18943370ljq.2
        for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2023 06:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679490885;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zZKHzNv/1adPHjb9eM0XnoO0wceG1we9IEhowaO4NXQ=;
        b=gSJR3q5A+RGT0lZhuaEPN7xzUHOG9TajejImI3QImJka+zgbM6p+0O7W3Vh8yMbjDC
         Fq6m2wfXoZefR58Ayr3g5oc3KM2Jf4n0mE33JNAWjXPEgYPxTPisSaADWFPl13gswUW/
         nJvgmNmC6Aw+JKJ0t3W7InImdKCh+CI0saKcskeyjCWjXTsNmzPgvScOwKvOFLHbkvx0
         nclcwGnpq6nZjXwc6GR/I9qY/oVKO7f+ulIaJGF/Br/7a7+EqU3poz0ipqxg7eyTaWxE
         CmW+6FvKfIOOhfNCgn8HRp2ZWb1svl18W8rIYh/DxjMvTG4ZA4ojaRjkZ91jBwdpEi74
         ZMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679490885;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZKHzNv/1adPHjb9eM0XnoO0wceG1we9IEhowaO4NXQ=;
        b=vBDQ9CcxdB+YUvc0h6WvC6ABpzdbzAJZNc4nxsXLOfCmVaJWV1o19dxCL7veqwYVrk
         JUAfx+9kp6FhfgPypOgnli1B5q5R+D+oSpg7F6pzTOH0Zd1msQD/0yVy+RxtuAHlpqNk
         SnNQ8ywcKPW4JhfgjZc6lB60yqqWInlgOJv4sT2gaHZe+Z56/zUxSNLJ9vFdPa6NG5FA
         AyvInq25I/34t6FUv0nsvYQ21jGvLcr8cNWrKrFXY0NKk1SgJnzaf4Bki0e2V9fh3ETl
         /1xHIXX2XIefaPGdNYz/rY7Gh5DUu33XTMRggL/Er6zYZfFXwi3Zio6VpdDMQnOCrkZP
         rX3w==
X-Gm-Message-State: AO0yUKXrlEGIlh27UJ69ylP3ttx/pgAEeMYHlVSddpA0a59HIK+hAymk
	n497fAiXkxPgWKgFDJlU/sHfwoKBFyI=
X-Google-Smtp-Source: AK7set8pnA/sXMLaTbtyz/hNKuJkG5x4NyIUdtet+gBDcgIeiD1z8qWeCx+3muZjxYMiOMo2BZH9LA==
X-Received: by 2002:a2e:82d6:0:b0:29b:7501:1885 with SMTP id n22-20020a2e82d6000000b0029b75011885mr2111073ljh.50.1679490884777;
        Wed, 22 Mar 2023 06:14:44 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id u14-20020a2e854e000000b00299ab2475ebsm2609333ljj.1.2023.03.22.06.14.44
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 06:14:44 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 32MDEfBL012009
	for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2023 16:14:42 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 32MDEeCI012008
	for openbmc@lists.ozlabs.org; Wed, 22 Mar 2023 16:14:40 +0300
Date: Wed, 22 Mar 2023 16:14:40 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: Plans regarding PECI sensors and PCIe inventory with upstream Linux
Message-ID: <ZBr/QC4P32yoZyzs@home.paul.comp>
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

Hello,

Recently OpenBMC switched to newer Linux version which got upstream
support for the PECI bus, with CPU and DIMM modules temperature
sensors reported via it. I assume this is essential for all
Intel-based server motherboards as monitoring CPU temperature and
spinning fans accordingly is one of the core BMC functionalities.

However, I wasn't able to find[0] any sign that this code can actually
be used in OpenBMC. intelcpusensor daemon exits early as the upstream
code doesn't implement the IOCTLs for direct userspace bus
operations. Is there any work planned to make it compatible, or was
some other way chosen?

Another related question is that peci-pcie daemon used for enumerating
host PCIe devices can no longer be used due to the same reason, is
there some replacement in the works? Where can I track its
development?

[0] https://gerrit.openbmc.org/q/project:openbmc/dbus-sensors+message:intelcpusensor

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
