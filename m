Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD84EEC818
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 18:43:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474V113CZ3zF6Ld
	for <lists+openbmc@lfdr.de>; Sat,  2 Nov 2019 04:43:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="j/dyk5yK"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474V074Q6RzF5Wg;
 Sat,  2 Nov 2019 04:43:03 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id v19so7541195pfm.3;
 Fri, 01 Nov 2019 10:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QJl/9GvOTo1mXoprS9Z1FVuoJT7cvJ0SfTXW2ZwsvWU=;
 b=j/dyk5yKG+/Zb+2zjd8u2xn3vzhnpgHTuI0xH+uDSZ798ljUjQgKbUMa+y4AKD4szr
 CgKNJadkohLyHsfXr3XjvG8wEdsnapCo57hAincCLWN/bZgW/2PXLq1xqcg1W/6EWxlX
 8Q0zZtGSnPhMRXK92TNutM7SdHm2GaTJT1EiOdvEbX/utf+AMfyGYxWbnAGkN6djE494
 eHNyGrgpjH6Ar7SWoytBdfhd8Zbi6eiZPw1uRRTV4mx36oZ3kVA0j7mDDTgmfRf0Yty4
 K1Zbd3kSgqOy/yxgWwlbo/e8LYg/9UoTPCZ6G7uHuYn0I8fmFokfdibxNpc94c4tcFJK
 DLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QJl/9GvOTo1mXoprS9Z1FVuoJT7cvJ0SfTXW2ZwsvWU=;
 b=REcv0rccSvGkkUaV9mMGz6jJXMvl+GY54u7jzP8V3PQ/uorAia+YZBtlRKP97Xc0vM
 HUszwHGfcaIlt/CG2pAQApSytqV6zBkRHRYfsNE4dM/lv/v+PbwhfK0lIydVKCGoZYIu
 ggCCggM59q4Pltq/PtGOdsYhFnWUICRzowsjSEny2GUIeyp/aj+cedEx5/97TpOaUdnw
 RCSKoVeZNuBBQz1lSGjg8gnv68Doqojitw8OWkg1SZXeUjBMfmOvzLQvhbEhDcKLY20/
 wx2Da2OOqg/joNzR6WLUlagETCfPZA0sJFSKjDgaL8gzy3ocy4jki/1Bpku07pg0BHEx
 /ktw==
X-Gm-Message-State: APjAAAXgwW67IOGyxqeT9xDbqdQTk0NOTe5NxZ7PXUhfyVBl22YE16CL
 vT95E9cbPqKDX39sExk8KPk=
X-Google-Smtp-Source: APXvYqzRiEfVYYVOG6O+ih3xK5Ax5k+9SP+dNi0+K0ffGqjJhG2LgDZzVmOsjy+yKL16LdvxRSyadg==
X-Received: by 2002:a65:4c41:: with SMTP id l1mr14902663pgr.163.1572630180944; 
 Fri, 01 Nov 2019 10:43:00 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:200::1:e697])
 by smtp.gmail.com with ESMTPSA id a6sm9045892pja.30.2019.11.01.10.43.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Nov 2019 10:43:00 -0700 (PDT)
Date: Fri, 1 Nov 2019 10:42:57 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/4] ARM: dts: aspeed: add dtsi for Facebook AST2500
 Network BMCs
Message-ID: <20191101174257.GB13557@taoren-ubuntu-R90MNF91>
References: <20191021194820.293556-1-taoren@fb.com>
 <20191021194820.293556-2-taoren@fb.com>
 <CACPK8XfebA9PcpyWkofCJ5fAZ9ddUjQ4ZeCf73KXb51+k_+N1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XfebA9PcpyWkofCJ5fAZ9ddUjQ4ZeCf73KXb51+k_+N1Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Tao Ren <taoren@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 01, 2019 at 10:12:10AM +0000, Joel Stanley wrote:
> On Mon, 21 Oct 2019 at 19:49, Tao Ren <taoren@fb.com> wrote:
> >
> > Introduce "facebook-netbmc-ast2500-common.dtsi" which is included by all
> > Facebook AST2500 Network BMC platforms. The major purpose is to minimize
> > duplicated device entries cross Facebook Network BMC dts files.
> >
> 
> > +
> > +&mac1 {
> > +       status = "okay";
> > +       no-hw-checksum;
> 
> Was this included to work around the IPv6 issue that Benh recently fixed?
> 
> If you can test your platform with
> 88824e3bf29a2fcacfd9ebbfe03063649f0f3254 applied and the
> no-hw-checksum property removed, please send a follow up to remove
> this property.
> 
> It's not doing any harm, but by cleaning it up there's less chance
> others blindly copy the same thing.
> 
> Thanks,
> 
> Joel

Yes. I'm planning to try the patch. Will send out a followup patch to
remove the line if everything goes fine.

Cheers,

Tao

> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> > +};
