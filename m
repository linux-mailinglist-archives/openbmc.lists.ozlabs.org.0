Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 600D747F0A3
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 20:21:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLH3v5qtFz2ywt
	for <lists+openbmc@lfdr.de>; Sat, 25 Dec 2021 06:21:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nZ8xZA8V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nZ8xZA8V; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLH3W2lMBz2yJL
 for <openbmc@lists.ozlabs.org>; Sat, 25 Dec 2021 06:21:09 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id h2so10202631lfv.9
 for <openbmc@lists.ozlabs.org>; Fri, 24 Dec 2021 11:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=53yO0N08HKyBBgc+5GercQU/x3eYH5AA5Rt4yx9aies=;
 b=nZ8xZA8Vgx3LYjyIbxQ4v0EuF7hw4pi0Fbh9ZAiwB7gWhx0awBQryRyF4fzMSm5XIA
 HBetHywUZ+/jcgDNTKb0QQpcxqSRnscuX60D4Pc0KJi1KrSu5PtAxA/jQox98Buo4X+H
 lZh6NmILRZBDWI5vhHNWQXzWTOWKy1AGojZQsvnwYO57kBOtggkF8v7BUoLYgFgSOtjw
 wpbwcTbPO8ikoHrFaVoVut6VdGO7k9bRX3hmEZhUYyz1bN81nxF79wcRr1xdvRogyI/+
 bPeWipQPfPyCUWuVSVcRzik2kq1iC4ixHbpTPRHWdq8Oc2px77M2/0woiClPAKGtF7WA
 Vuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=53yO0N08HKyBBgc+5GercQU/x3eYH5AA5Rt4yx9aies=;
 b=P9G/WW1F+tjVghwsHzVFM/KSwCboyShAZlphCjXLYVFTP5OydYBuj/L5ep4Fh9Hsip
 wUJsXRQGTz8vzi7CcH/3uRtrEEUMiBbKfbZ8MyWveCQxct5uV06uNRQo9LoSj38nGLNX
 haH3XpVT6WQZvNjAyj2Fcx11nw3TEePvL0WmDFmM7WF5avzbpGaUeV7QAeE6EJ4MZ1wX
 wcPxBiAyDJynddLxuqhfVfvgiH65CANOFOOiKycQyUsqYQXPAGxEzI443c8HNvQRS5Qb
 hQxM4M+ikYJXNgN1Hj+06xD2SX56olijGYdp9yAjKYabh+9v4rIR1iuleAAKYRD0+Yr4
 1GzA==
X-Gm-Message-State: AOAM531YtoxxzIY7yypk5vI64c4FNWT5UpLcqCuKAqPIhDC0+J+JJUIk
 yOBloSprOVIx4Xnh4oXWLkU=
X-Google-Smtp-Source: ABdhPJxx+Sihk7SCXDvTU6AryhMB4FLn8OJSLErqaBbR5JYEOcLYFz4WB8JoRI2KPMtTIemp+H79dQ==
X-Received: by 2002:a05:6512:3ee:: with SMTP id
 n14mr6199416lfq.611.1640373665502; 
 Fri, 24 Dec 2021 11:21:05 -0800 (PST)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id s14sm888947lfg.43.2021.12.24.11.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 11:21:04 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 1BOJL15D004800;
 Fri, 24 Dec 2021 22:21:02 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 1BOJL0Hs004799;
 Fri, 24 Dec 2021 22:21:01 +0300
Date: Fri, 24 Dec 2021 22:21:00 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: sdbusplus reading InterfacesAdded issue: not all variants are
 created equal
Message-ID: <YcYdnOrekbXDvm5F@home.paul.comp>
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

On Thu, Dec 23, 2021 at 10:24:30AM -0600, Patrick Williams wrote:
> You could pretty easily add a `merge_variant` on top of this that
> would be the union of all the variant types.

This seems to work but I have near-zero clue about templates
meta-programming, please bear with me. Does this look suitable as an
another sdbusplus utility, should I send it for review after adding
docs?

template <typename T, typename... Unused>
struct merge_variant
{   
    using type = T;
};
template <typename D, typename... Done, typename... First, typename... Rest>
struct merge_variant<std::variant<D, Done...>, std::variant<First...>, Rest...>
    : public merge_variant<
          sdbusplus::utility::dedup_variant_t<D, Done..., First...>, Rest...>
{
};
template <typename... T>
using merge_variant_t = typename merge_variant<T...>::type;

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
