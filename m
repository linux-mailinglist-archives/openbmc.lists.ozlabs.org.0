Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE5947EEE3
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 13:54:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JL6TG1sXqz2ynK
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 23:54:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iI5dOex4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iI5dOex4; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JL6Ss189Sz2xKJ
 for <openbmc@lists.ozlabs.org>; Fri, 24 Dec 2021 23:54:03 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id h21so1949279ljh.3
 for <openbmc@lists.ozlabs.org>; Fri, 24 Dec 2021 04:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VtK3+vV+Qzz7in0nJOd86h96+cq+izF+nv4jZ+ypf3M=;
 b=iI5dOex4sT+zILRZhpENLivzlsQXUdp13bJivdjq1V2nxwBwVgQ04oCrowsXmZ5q/Q
 CSmg2lJlPNKbJU/m5NOrCO9o5kPzE0DW96FS9ObKPdRvO1K83hg6abChnCTrm63cZCrQ
 D/+jUzJ67D+pdS14KOcesXVxLQcPc2qon1d78T1i6iPPAIUZ6XNKEQPCjPb4JV/2lc8Y
 Q+xi7CiYPnja2U8uQoAyUVm1TjP+f+gZfa1NyCBpaZhn0MGYWUmA5EMKKqouCYBj1JPY
 wvJxKm+4IL1dwQFa+BXEycH3jrn08a9tCCTDOD0yeXXHjYYEKK9I026J9Y6+HtMDN26c
 QcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VtK3+vV+Qzz7in0nJOd86h96+cq+izF+nv4jZ+ypf3M=;
 b=MzI3NJH7ZzHJRhCAH3uOAHGgcgm3IrvgBMiPcIZfx+kojMAc0KjdFRh4upFt3uEmwn
 y8TkoBDilNoA9CAkT0emXGX1qlXawM3YtdTbjkdKP8MRB5xWq9A/8GwcqEBjF0IK/wDY
 vgqi4saf/EvIodmV3c0pVZnAxHj9sar/O0wK65kXzXGw/PMSk2fbkJlKs8NPEr3Xr2wT
 vvvO/74AR6rH2jh+yy05qJ23L/m/wluT/AsSnweUZG6aB0wLgBVGUFcaRXO7uBtG2/VM
 +kKRVCyam1+uyiV4vLbMZiDcXBk8Amw9wjFqQcIr8hnVS4cLxlCEG8hk2FIHNwz5gKMh
 l6hA==
X-Gm-Message-State: AOAM531PRbWHaeGtQpeoCgQ523mmKc+96A2QqkraSPk66n6a4glip1FQ
 iBXhnx/APu48n13e/s58/gBjX4VELhc=
X-Google-Smtp-Source: ABdhPJxmyNPmJ16qq7HBR/uY+vqAPZ4yPx0dGN3fqV3ETWbMOtUXYJLR58vMJF477ybvkB697YZCTw==
X-Received: by 2002:a05:651c:1504:: with SMTP id
 e4mr4576592ljf.358.1640350435415; 
 Fri, 24 Dec 2021 04:53:55 -0800 (PST)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id q126sm709348ljb.32.2021.12.24.04.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 04:53:54 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 1BOCrpB6004243;
 Fri, 24 Dec 2021 15:53:52 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 1BOCrpDU004242;
 Fri, 24 Dec 2021 15:53:51 +0300
Date: Fri, 24 Dec 2021 15:53:51 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: sdbusplus reading InterfacesAdded issue: not all variants are
 created equal
Message-ID: <YcXC3w2gxZtei9qN@home.paul.comp>
References: <YcSZlt4HPeBO3sL3@home.paul.comp>
 <YcSivm8L7jKd/7gy@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcSivm8L7jKd/7gy@heinlein>
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

Hello Patrick,

Thank you for the prompt and elaborate response.

On Thu, Dec 23, 2021 at 10:24:30AM -0600, Patrick Williams wrote:
> > So what is the correct method of using statically-typed sdbusplus APIs
> > to parse such a "dynamic" reply?
> 
...
>  You could pretty easily add a `merge_variant` on top of this that
> would be the union of all the variant types.  Then, the type you'd
> pass into `msg.read` would be:
> 
>     using Value =
>         merge_variant<xyz::openbmc_project::Logging::Entry::PropertiesVariant,
>                       ...>;

Yep, I'll do that and submit a patch for phosphor-dbus-monitor after testing.

> You mentioned the InvalidEnum error.  I'd have to see what you were doing there
> but if you both an Enum-type and a std::string in the variant it should have
> parsed as a std::string if the Enum-matching was unsuccessful and not thrown an
> error.  I thought I had a test case for that exact scenario as well.  If you are
> seeing that, it sounds like a bug.

It is a bug all right, in the development processes of our company
where we primarily work with an outdated fork and it doesn't include
your a22dbf40a115d5cd133e67500afa387b317cac14 commit :/

Thank you for the clear hints, I'm working on doing the right thing to
test this now.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
