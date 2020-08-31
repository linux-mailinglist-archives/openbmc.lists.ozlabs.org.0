Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B998257B45
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 16:27:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgCFb47LRzDqDG
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 00:26:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ztPqhzY3; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgCC24Q8gzDq9y
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 00:24:45 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id c17so242407ybe.0
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fLpnPK7eu87XaGlByBpt38VRVqtsFoH87IpKb+ulU/k=;
 b=ztPqhzY36utzppcjgWDVzTihTfEDOCNo7oxf94MQtwuIsxbHg+8I1YpfRAiS12oYiz
 dG12fYxThTLN3owsv8uP+QFxroq/+dvUEizo0y6YmJSbgW6W0CpY8JHw1toKWyR4ZmM3
 DRpLd0VDQJ9xXVaXNcGGTDJqSWOeqJ7Gp5kGvcSqkAgnb/A0Y/JlYX5geNo4Z7AkuwO9
 e2Mi+0i4d86QDWeGIIhhwzlS5ZjGVHccSgd+KxW27S0l2RkRtJtfveSsWWI3whHALC1x
 i6fpiQgkjn//OGSqCvtOBkrVDLnEfZ0TuW2P0MYFTa9Er1jenB6k4fDwalpDipZ9y7zM
 2X1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fLpnPK7eu87XaGlByBpt38VRVqtsFoH87IpKb+ulU/k=;
 b=dwrBlyrJw1wFGEKEun8WIOBxenkpbcIPkRqjVoJxsj+PRJZz75jYtsnkDXDrRR42jw
 DljOdqZ4i0fP23ojenYo5cLxlzSBQGFiohzV2cMimtmhpQZLmSvja5sYYrhxN5u4JwUL
 NMsqkTvaZDFkpmhRWhd56LmzHe4ysk112yx7GqgUpPE5fJ8Q7Q0ZL9D8YDplGhkuOJvJ
 T02CGr8TX1TyYA1o21tElSLfTXR8n5XC9RYqeGX7PDX9A+7n4VwZHFtYvlpyFNuuVuY5
 A5GlWP+SNTo0lIS52UXfBrek3SYo2fXb/HOAPWkgUxmqWs9LrG7JO0P5Ml1ZPAed6puk
 /+nA==
X-Gm-Message-State: AOAM533IrRyW1lihirOTyXU20XW4w+nU4eRL0iYy/cffZJAunsX/yOPA
 VGQZWmkvhg6tx4Na7TIcdWv794BQMZ6nihQRxwjV3w==
X-Google-Smtp-Source: ABdhPJxSEQeKbC3f1TpvxcoRZpDXxJgMojGbAKW1KlVHns/WT3CECWVVmeEj84FlMwgHSzF1AI9zbdsdEAO7IkwfRbY=
X-Received: by 2002:a25:2d69:: with SMTP id s41mr2506127ybe.417.1598883881688; 
 Mon, 31 Aug 2020 07:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <92e6ad599b10400885d44e9d6b9c28ef@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <92e6ad599b10400885d44e9d6b9c28ef@SCL-EXCHMB-13.phoenix.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 31 Aug 2020 07:24:30 -0700
Message-ID: <CACWQX81DSFDNoLRKuidgMSDAkphPywLkb2ELBV=MEMi0f5nJWg@mail.gmail.com>
Subject: Re: Looking to do multiple platform ports uniformly with the ability
 to easily add more to follow.
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 27, 2020 at 1:08 PM Bruce Mitchell
<Bruce_Mitchell@phoenix.com> wrote:
>
> Our desire is to have our own platform ports for Wolf Pass and Tioga Pass, with more to come, with a consistent unified meta-phoenix/meta-<platform>

What is a "platform port" in this case?  There's already meta layers
for both platforms in upstream, and that would be the best place to
check in any platform specific fixes or functionality.  Please do not
check in platform-specific code into meta-phoenix.

> And looking to choose the best know methods and (re-)starting point(s).
> Need to row with the OpenBMC community and get it correct from the start.
>
> Thanks!
>
> --
> Bruce
>
>
