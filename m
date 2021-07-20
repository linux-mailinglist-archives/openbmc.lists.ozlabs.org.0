Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDF93CF73B
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 11:53:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTYvD4NRZz30QY
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 19:53:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=U0CQhg1e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U0CQhg1e; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTYty4Cy5z30Bw
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 19:53:28 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id d17so10203171ljq.12
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 02:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7SOVFk6RC1FByHs0aqZkjhtZU1qzgih7NPBL3O0ixuU=;
 b=U0CQhg1e70+HqiETMWMpTPb7OgL9InURtUxLcuvCWD4ACUHff3HM5LDgIkM2LJVKd8
 GTBSzQTaNSTPr0/IIBQwEEwtYB/Otq7stt5QgS/ZpyYrlgW48HsCacHCep53XzjeQ5EV
 NxYt6Kt844uKEh9HdbijY2jECP+o0zftOtL42YtkW+oeuZ+TuHihmgxTpqnUxossrQ3V
 J2D80/sLv8TRQRRjY6x8B43fXsg2BkHkK6bYR9jliiMW1uO+uu/eDlD4DbXLjyK+qqWD
 tN16jNfYgznZI8k1J5uAGoBbrwMQdNX5Pemg++UKzusvy4//qckGUolI/Ufx9em7BZ6D
 92Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7SOVFk6RC1FByHs0aqZkjhtZU1qzgih7NPBL3O0ixuU=;
 b=hh7sp+5C399UJhujV/TONL3yD98NwUwViWi618PuL2/1ZPATM/iacbTsdMbisLUR98
 +VXlm9KAzwAbfJx2iXZsY3di00ELt5VoMdsDuSJFX9aGqb3fSx4Sc3sIiKerkHvtMPbh
 MghZOtTixs4wn5dfJFAIg+WhGx1tiLDia1hZzeIblSNJqxtHQ3F+8jb5vkyPUaEIEp5a
 DLM9azdoaVT5MUE/p16U+6h2oREsYSTBAeFapOQxHVwCUjfG9MWOWKnMX/d1UowiRiHZ
 iA6Jtp/yiKJUPh6TsOwzkoW5CaZ3/igZhDpvn4+teAslZbaXQ1ZsF41hbhDad2abH2Ig
 WDtQ==
X-Gm-Message-State: AOAM531gHkwl8xB2qiwOqXlHhRQEd3edvDj2U708cSkA92PXk5lDF4ir
 H60O9xSrDlz5cjlI5KOuzZ0=
X-Google-Smtp-Source: ABdhPJyPvtDNEIatmd3xrxCWdB+EDoMDLc4gZHvPo2zQtBYaPNyGIsANAu/skP6OvMAAzgzVqrQ9hQ==
X-Received: by 2002:a2e:9009:: with SMTP id h9mr26154821ljg.213.1626774804029; 
 Tue, 20 Jul 2021 02:53:24 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id j18sm1911470ljq.19.2021.07.20.02.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 02:53:23 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 16K9rK73004857; Tue, 20 Jul 2021 12:53:21 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 16K9rKWX004856;
 Tue, 20 Jul 2021 12:53:20 +0300
Date: Tue, 20 Jul 2021 12:53:20 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH v2 0/3] net/ncsi: Add NCSI Intel OEM command to keep PHY
 link up
Message-ID: <20210720095320.GB4789@home.paul.comp>
References: <20210708122754.555846-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708122754.555846-1-i.mikhaylov@yadro.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Jul 08, 2021 at 03:27:51PM +0300, Ivan Mikhaylov wrote:
> Add NCSI Intel OEM command to keep PHY link up and prevents any channel
> resets during the host load on i210.

There're multiple things to consider here and I have hesitations about
the way you propose to solve the issue.

While the host is booted up and fully functional it assumes it has
full proper control of network cards, and sometimes it really needs to
reset them to e.g. recover from crashed firmware. The PHY resets might
also make sense in certain cases, and so in general having this "link
up" bit set all the time might be breaking assumptions.

As far as I can tell the Intel developers assumed you would enable
this bit just prior to powering on the host and turn off after all the
POST codes are transferred and we can assume the host system is done
with the UEFI stage and the real OS took over.

OpenBMC seems to have all the necessary hooks to do it that way, and
you have a netlink command to send whatever you need for that from the
userspace, e.g. with the "C version" ncsi-netlink command to set this
bit just run:

ncsi-netlink -l 3 -c 0 -p 0 -o 0x50 0x00 0x00 0x01 0x57 0x20 0x00 0x01

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/36592
would provide an OpenBMC-specific way too.


There's another related thing to consider here: by default I210 has
power-saving modes enabled and so when BMC is booting the link is
established only in 100BASE-T mode. With this configuration and this
bit always set you'd be always stuck to that, never getting Gigabit
speeds.

For server motherboards I propose to configure I210 with this:
./eeupdate64e /all /ww 0x13 0x0081 # disable Low Power Link Up
./eeupdate64e /all /ww 0x20 0x2004 # enable 1000 in non-D0a
(it's a one-time operation that's best to be performed along with the
initial I210 flashing)


Ivan, so far I have an impression that the user-space solution would
be much easier, flexible and manageable and that there's no need for
this command to be in Linux at all.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
