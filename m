Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF0C36DD97
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 18:54:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVl8v3c7xz2yyF
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 02:54:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=kRxiKQkV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=kRxiKQkV; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVl8g6cWGz2yjD
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 02:54:09 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id x19so69960122lfa.2
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 09:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Q0nvZC4y+TYCfPtpaO19py9c2WBqY4ByAYrMppMX1A=;
 b=kRxiKQkVWScuhtzTonB5YHV6oLniAerLWm4AKIYgGVTPzNuK7shuiZYxTw0n37f/S0
 KpAAtuKH6PPdZx5Hp/1T09PcFJpQp+n4BDCIenfBoaJSAWhMr1Oq4uFFcHQDujs1hD9+
 TNd7j3qUSuBNJusqt1g8dKuaVOn5AjlSe64rM7BzSqtGybXhxk/pvfN+iFUGN9AdUuBt
 V9JoYUbseIIJt2pYZB+56109JVllcU012mAsD+K6St+i6uTKcWONWbcuKicQg0haUkZU
 b8HTidpIq01XRYypz5v3GNuShgWpRcbr3kH/wWqgfkr4DV0u68Sy+adsHaganmEJTtm5
 cw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Q0nvZC4y+TYCfPtpaO19py9c2WBqY4ByAYrMppMX1A=;
 b=gVhbGNgSECbUO9fp3ym1dDykB9PhqflTSL0wFoSQLjs/Q90uBzbx3Ajha/dxyWZ/rs
 +bOIZzG0H/uxBPir4hCeO4qhqSuu+5P16d7gViDutEYuxaxTQVlM+M3wblDhYvWrYaja
 qV1Ykqsde2XHzGufRNFpVR1DJWpc4OooTh/kTRbtZXICsgb8nL076BVsbaSWBdJbxTBz
 pXob0/Woeyf+mUUoqK1J4G9wKyQIkulbs021sC+yAIY6pOKEAHVeIHAR+DQEBuNhcEQC
 bUbyNtNIlfwI7qCeCKbuz6QLWelIZsBCTCOhEu3NGC4vjE27u92w06DbehdRvWJk/iBa
 6NFw==
X-Gm-Message-State: AOAM53363o5ORYxwvptLKpyxqA58HNEzP9Z4fN3QSTDfVL9Kv4mQPllO
 v+Ss4TOCe4z6nqD/qB/cM/wyTn+YJY/wu5+jX5OlrQr4Wmg=
X-Google-Smtp-Source: ABdhPJwpev5BEIZtZhhBChF8qpFcj4DoUsXs+L68R0OoVnUuIPmBaVODZ5Za0KkZ+/io9Eg8D3RUx+mt88YCzrujm8I=
X-Received: by 2002:adf:dec7:: with SMTP id i7mr23137594wrn.407.1619628408879; 
 Wed, 28 Apr 2021 09:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <a3b81496-b34d-9198-66b0-f335de61a677@linux.vnet.ibm.com>
In-Reply-To: <a3b81496-b34d-9198-66b0-f335de61a677@linux.vnet.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 28 Apr 2021 09:46:37 -0700
Message-ID: <CAH2-KxD1kB25nYADKzJ9rCb0+fu1mWKiQ_KMQ9nRvvi7ids_4w@mail.gmail.com>
Subject: Re: Move Inventory.Item.Board from Redfish Chassis to Redfish Assembly
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, Derick <derick.montague@gmail.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 28, 2021 at 9:18 AM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>
>  From some discussion on Discord a few weeks ago. A newer way of
> thinking in Redfish is for a simple rack server to just have one Redfish
> Chassis and things like boards modeled as Redfish Assemblies under the
> Chassis.[1][2] Today we look for inventory item chassis and inventory
> item board[3] to populate the Chassis collection.[4] I propose we move
> the "Inventory.Item.Board" from Redfish Chassis to Redfish Assembly.
> Does this break anyone?

This will definitely break people, given that sensors can be attached
to boards today, and (unless I'm mistaken) Assemblies don't have their
own sensors.  Is there a solution to the sensor issue baked into this
proposal?

> Does anyone have an inventory item board that
> can't be a Redfish Assembly?
>
> Another option would be to only move certain inventory item boards to
> Redfish Assembly, determined by a BoardType or additional more detailed
> Inventory Item interfaces around boards. Unless this is needed though
> would prefer the former for simplicity.

I wouldn't be for this option for the same reasons you do.

>
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39574 is adding
> the Assembly schema. This would be a later commit moving
> "Inventory.Item.Board".
>
> [1]https://redfish.dmtf.org/redfish/mockups/v1/1018
> [2]https://redfishforum.com/thread/325/fru-properties-redfish
>
> [3]https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Inventory/Item/Board.interface.yaml
>
> [4]https://github.com/openbmc/bmcweb/blob/8d1b46d7f8d39db2ba048f9e9007106ca3a28c9b/redfish-core/lib/chassis.hpp#L189
>
> https://redfish.dmtf.org/schemas/v1/Chassis.v1_15_0.json
> https://redfish.dmtf.org/schemas/v1/Assembly.v1_3_0.json
>
> Thanks,
> Gunnar
