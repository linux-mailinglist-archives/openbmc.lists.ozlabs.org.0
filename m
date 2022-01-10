Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B31A6489B72
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 15:40:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXc1v4XJwz2ynM
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 01:40:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RvvEYRmm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RvvEYRmm; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXc1S5WPMz2xBv
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 01:40:11 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id o12so45161278lfk.1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 06:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=N9AL/NEUp4cVgHGjZI5dE6vS2nNdQWsAP3naQTsusmY=;
 b=RvvEYRmm322UIX+jodR9OoL+dDC7kIxnGd5lliClOKJNESHy/nR4cANFJMEBZGVR0I
 POmMJTxWfDKV5anzhqtD8h/1aoZ6N44den7gXh8aMyH17TxjfiUVHdsbiMLhjBaic+mE
 U3R0cyox+05tXVDqOKshMUaAdX1sjRb7vjxc1b6FciivwbvEiOuIzcyykVF9RPFDfpGx
 W768POv5H0tiuzcsVGgTbSsFGdhzqAaNGMccCxQ16y0Yy/bLhGkAK0nnXAQJjedXWPUk
 y6a1xq/p6i3kSMC7Hyfz7/gg988HJGnTqVrVZ4udGvrCYP3ix1neiq2LHuGuV+SWiAQk
 J/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N9AL/NEUp4cVgHGjZI5dE6vS2nNdQWsAP3naQTsusmY=;
 b=b4SwBt47Cjmfc06+puVb+98NRzqXtBO7HvlrLgDDOKiIlI6/h7xp1Hv5+16Zd4tJvQ
 8TixYPF+cuTsJfNrOR0A5BEv391kJLAPSAJv5HpZxelEd0EdsjytPpDFwdMS/cP+URJp
 z+oCfXXTDrkJLPAf4Oyze5+PzGiV3H6X+ynVpiboME+TTtWOz6izd3+inFoz/Ici9wp/
 D0TAmEw5n/8f40r/Tvl/wT0nrV+mS+WhFeSj7PAmSlsDNMr6CDcEmAKABg7KkTXCgY03
 9beAfddgGUMizEZY1BLYAGCQfLndg3Tg1Q0mRG8Z2PIVHMbkoG0jTm15Yn7gUuuSzrkc
 drag==
X-Gm-Message-State: AOAM531vFAztDCE6SojFR/GixoivsynHPMNgnrfwyiIoveMDrB5QbqKy
 Mml8jUjD3c9xCg5v30/T8Fc=
X-Google-Smtp-Source: ABdhPJzYgm6xo5cfDg2XIlmTsgTeudC0fZoTLo9la70WXXTtQ524P0KjV3ODuMddfCnpNpwzdpQgog==
X-Received: by 2002:a19:7619:: with SMTP id c25mr50481lff.302.1641825606597;
 Mon, 10 Jan 2022 06:40:06 -0800 (PST)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id y10sm1045608lfh.165.2022.01.10.06.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:06 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 20AEe3jp004652;
 Mon, 10 Jan 2022 17:40:04 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 20AEe2k3004651;
 Mon, 10 Jan 2022 17:40:02 +0300
Date: Mon, 10 Jan 2022 17:40:02 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>
Subject: Re: LDAP groups and roles mapping
Message-ID: <YdxFQl9Opddem7O5@home.paul.comp>
References: <Ydw+3uYSqK44CTHq@nbwork.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydw+3uYSqK44CTHq@nbwork.lan>
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

Hi,

On Mon, Jan 10, 2022 at 05:12:46PM +0300, Alexander A. Filippov wrote:
> Our customers want LDAP groups and roles mapping working not only by primary
> group, but also by the membership in one of these groups.
> And this requirement seems to me reasonable.

A sidenote: windows active directory admins might also want you to
take nested groups into consideration. I suggest you check with the
customers if that's the case or not.

AFAIK there's no standard way to do that (other than recursively walk
through the group membership) but microsoft has
LDAP_MATCHING_RULE_IN_CHAIN OID:
https://docs.microsoft.com/en-us/windows/win32/adsi/search-filter-syntax

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
