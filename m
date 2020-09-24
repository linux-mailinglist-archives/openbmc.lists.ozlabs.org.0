Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1CB276658
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 04:25:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxf5q1QtKzDqHF
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 12:25:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=xOaqAheH; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxf561J7zzDqNt
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 12:24:38 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id x8so1175058ybe.12
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 19:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YoLNJXue+6WlfUKLVJDkHJbArP4JwgYnv0VF4o7qHGw=;
 b=xOaqAheH0LxWVjbSHHxfxT4boqayq0sYmGG+jcxV2w3HVu9FUX2leUqgjZEHQPeSeE
 zFPrEtt+6hy+UL5ii3rOvNdWSE4DHfmyREkm4jcJ9DkTFHudBPZPQXrcmy2LJU/A0X37
 wjbCfZ49FxslObCEdc22oQmvd4925zUyLRNJp59B0X9xaAVEiYGR3BC+V1pO6Azii2eF
 8/wn3fDNd+Axp17RJ5Ni03NOHMclwBZ9WfdDA2ecj3o3p34eNZRrqF/2PET0ZJh3ylLW
 7sSrB8Z3du5bPKPS4+z7GTLF3Kp+ePg3ctOMDceUZ7bX2KG0v0r59j7cj+XGlaBiqiIH
 gLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YoLNJXue+6WlfUKLVJDkHJbArP4JwgYnv0VF4o7qHGw=;
 b=QMxSTV9zI08Yuk/6VLQNrQ7btVCVTjjr+TDOQBMdwSPaYY4lGlw08HI1BrPWMjcbsD
 AnvI8fYhUjOM6v3Hs3AQNLTxW5CajkmzHHgOrgpn2XACEVZY+BDUi4otFQGmV27KPu2w
 F77/LpmccJTUd+tgEtYuwXkfOciTPUOmNEHp/Tibb6qREfl+KbeGY0h1zAcA7q/Cc2RC
 a6l13LWSOdNbMUXiHbG2i5PIY1GfVpL10nTv8dO1wPaWgI8I5SU9cYvkbtgKzBoJGHh+
 xLmNmO/v3HH3Rt1KF1mvdqVA/1xcuO6CLKo5MjZK45+0KEcPsP65tjmq3WwLDYOcFDQE
 TQiA==
X-Gm-Message-State: AOAM530rQx41Z38VPXkuhmB1oSeNBQgTXoWjsOk4f4e3heRZOhCzkVek
 0PjsxPtiuBMi0KbZnTWOPyfwfDnh7l0S8MHAM8PIXA==
X-Google-Smtp-Source: ABdhPJzgIgXiyJYDnDD6vp8sYKE4MHJ1OIMiKlvbmb7+J+0FbVFCHN2s98MvvxiCRmqGDxB2ARLOUD4OCG6H/JxWHKo=
X-Received: by 2002:a25:14c4:: with SMTP id 187mr4392498ybu.449.1600914274083; 
 Wed, 23 Sep 2020 19:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com> <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
 <20200923202113.GT6152@heinlein>
 <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
 <20200923214237.GV6152@heinlein>
 <CACWQX82uw_PEWouQ0tu=vKL_Wh_G8t-yUiEQ64RJh=0O=vDSAA@mail.gmail.com>
 <4F207AFD-3CE9-4AA3-B520-34C63041EB55@fb.com>
In-Reply-To: <4F207AFD-3CE9-4AA3-B520-34C63041EB55@fb.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 23 Sep 2020 19:24:23 -0700
Message-ID: <CACWQX831_jv3NXBEjX6mCDgne65ynASgAeNNHUpiOUfME53Swg@mail.gmail.com>
Subject: Re: Chassis reset
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23, 2020 at 6:59 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>     >
>     > I'm not understanding what you mean by "come up with an API to steer the
>     > Redfish..."  I think everything is specified here at a dbus level.  The
>     > issue is figuring out the appropriate Redfish model of
>     > Chassis/ComputerSystem objects (along with the included Resource.Reset
>     > types).  To a casual reader, who hasn't been involved much in Redfish
>     > implementation, the current mapping of these ResetTypes seems fairly
>     > arbitrary.
>
>     Some might be arbitrary, but most are explicit and chosen on purpose,
>     especially in the case of the System schema.  The Chassis schema is a
>     little more lax, as it's more of a backward compatibility thing today.
>     I think you (Vijay) are the first person trying to model it
>     "properly".
>
>     What I mean is that the current Redfish definition of Chassis points
>     the PowerCycle action to chassis0.  That PowerCycle action now needs
>     to point at multiple things, chassis0 if we don't support AC reset, or
>     chassis_system0 if we do.  That is the "steering" I was referring to.
>
> How about we map powerCycle to chassis0 and ForceRestart to chassis_system0
>
>

I would not be in favor of this.  Technically you're implementing a
PowerCycle here as you're cycling the power supplies off then on.  A
ForceReset would be if you asserted some kind of reset pin to the
board, while keeping the power supplies up, which, while valid, is not
what you're doing.
Also, it would mean that we have multiple actions to maintain
externally, and users would have no guarantees about which ones are
supported.  Mapping PowerCycle to the best supported mechanism we have
seems like the best thing to do here.
