Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD0F7C8541
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 14:05:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KnS+aP4M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6QDn2wd2z3dDT
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 23:05:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KnS+aP4M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6QDB6R8Mz2yDD
	for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2023 23:04:41 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-503397ee920so2499142e87.1
        for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2023 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697198672; x=1697803472; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X520iukCTJClLSLUWRjOO7Ibb+sEvTAMuRi0WpwIarI=;
        b=KnS+aP4MvkjAquxOs37SopCExDTaNyj/zmYpNtt3Kvv2i2KS6m7dbRgPFVKJwDIalL
         xEgmiWYce3c786IMOPv4Qu3L9YXsEGSZUimC4wUzlkMYLulsetV9/PDxx3cBMY82ZwrH
         xgNR5RA8XtTS5xjTib0E2L/L9tISM99/7BsrifKKX5cX5wHsKHxzmIJ5vNsDUxN+Rqw1
         6kKeMO5aGH+M8yAeCSvYPsEZ1Woz/r1hRtUQ0IDnVJR74uLOhGMOAi5aap1aKx6qMwI8
         X4haFh7LJFnxPCWmS5AoBlvcUoG9ePTAieYYOKkPtJNW9zhyJNE7nnXa0OgurT2pE/r6
         H6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697198672; x=1697803472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X520iukCTJClLSLUWRjOO7Ibb+sEvTAMuRi0WpwIarI=;
        b=k1W8MJ70yhUtzjYIjWHKxnhY3xt9jvU18cHFtKerbWjTSfWWhsaZzH1aQbL7gptkGl
         d90Rg3g4Zb5/zT5x4poOv7hAJkmnYct0g5zMGC/ucBAWNGzke+arJO0gDpwuJvRLzG/m
         4//3NUsX9oKfuN4idLvwLaSJdBXfcZxVIlDIwdqgI1S3oZRuZco26I9l5+oGLCTuCDOX
         J0qJCFrzW6cAwUJgRGlhUnRIzFZlzzDVWoqVfBDpP6nYx53ixn7HvUo6i3XLTvEfnD4V
         r3uGIagI1IsL6Wnb47h0KsXYA5VzEAlIwvvuGo12WCzHcRAAh989mPFNYWzv7xbL+39l
         IERA==
X-Gm-Message-State: AOJu0Yxpl/2ME7GN2QjDVRMUyUVXVLL2TAhm8VESSEq+/YFbffJSdJuL
	gdkbfL0T2QRoHCS0Yte34EA=
X-Google-Smtp-Source: AGHT+IHKen8XjPOvmBomU45Yuh4V/z6QXSuElBNs6h818fqHeU+BmOXk26sCQ8oQF5VYDl0mT/55sA==
X-Received: by 2002:a05:6512:48f:b0:507:9701:2700 with SMTP id v15-20020a056512048f00b0050797012700mr2295203lfq.20.1697198671890;
        Fri, 13 Oct 2023 05:04:31 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id o9-20020a05651238a900b00505666d024csm3325195lft.102.2023.10.13.05.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 05:04:31 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 39DC4RhV025629;
	Fri, 13 Oct 2023 15:04:28 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 39DC4RjE025628;
	Fri, 13 Oct 2023 15:04:27 +0300
Date: Fri, 13 Oct 2023 15:04:27 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: Add network RoutingPolicyRules at OpenBMC Networkd
Message-ID: <ZSkySyyLSmmonxiW@home.paul.comp>
References: <CAM4DKZnvnb=XMvxVhrfE13vvb+braB6J2TOhKMRxm+T09u88Fg@mail.gmail.com>
 <c0dc4e1ff3904a9c8f34c951611d3992@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0dc4e1ff3904a9c8f34c951611d3992@yadro.com>
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
Cc: raviteja bailapudi <raviteja28031990@gmail.com>, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Sunitha Harish <sunithaharish04@gmail.com>, "johnathanx.mantey@intel.com" <johnathanx.mantey@intel.com>, "wak@google.com" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

A short clarification inline.

On Fri, Oct 13, 2023 at 11:18:33AM +0000, Alexander Amelkin wrote:
> I may be missing some use-cases, but I gather link-local addresses are primarily
> needed for discovery of newly installed OpenBMC
> 
> machines before they are properly integrated into a DHCP-based or statically
> configure network. Taking that into account, in my
> 
> humble opinion, the best way would be to have link-local addressing enabled for
> just eth0.

To avoid potential of confusion it's important to note that the
reasoning applies to legacy IP only, for IPv6 every interface normally
has a link-local address at all times.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
