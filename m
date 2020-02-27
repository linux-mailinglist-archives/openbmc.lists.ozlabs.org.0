Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2221172BA6
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 23:43:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T74j2trmzDr8m
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 09:43:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qn+7NLia; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T73k1pSCzDr7J;
 Fri, 28 Feb 2020 09:42:58 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id h8so420326pgs.9;
 Thu, 27 Feb 2020 14:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eC6XULGo71DkkbKYMEVa3CebZbR3YIk7hU1LZdfvH4Y=;
 b=qn+7NLiaVpezukxBzFBwfG+epP+sfl+YlsORRJxCCoojrQj/h+YkBxM3i6YDE0AQJs
 P7T7DFMTB9R1RXIaeliDZ/dyWhM6CuLv2kO/sytHwO7bES5aZttcq2BrppClH47OLbih
 8glkk1PmO0wSymairAZIAQPbdboYTf0jc9+6madbyvW0p84zWN/JxZ4udBJCDn6mRfqt
 jd9n5MmIClzXAQ9CHp/v1tEiTBrPm4tZ7i/cyZuEmoDelTi8Iz9b5FAUMOXDPMbqEEX7
 ODi3nQW4+kEH1AhkrhqS4TXIZWBBmPcmnkuQblEIuHdpsioRqGi/GZZCFJdDdpOtidJT
 pm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eC6XULGo71DkkbKYMEVa3CebZbR3YIk7hU1LZdfvH4Y=;
 b=sB8tPXmWbgoRQHU0SzH22l8brPaz460Z8t1b+QAiX61nnRqPi/Xr+BpEXjTPKvZo9O
 SCJ8K+hD1f4H/xbO8lbHeyBTGhlqV/MmjVGo/oDF9+VTebxukpcRZmcELFJcTDLTUhee
 /CVC/nsmhQ07NatXKZsqUwktcbPlIeD8vpPWCTMCMhaThOs/ChB92zGZ56y1IKoQYzyV
 WyIhGHExjpWatPvMJiHzl37KwcoySFQMZNXpavnlm1SNRs2aWNRLQu4g8imcYSj1EwYV
 4rt8WKTycazXbH/ZQhgd+LFwrrLHfOiqD/GVotGSkULfHkOzwP3XxK+2a7Dq0vAG5lgF
 3axQ==
X-Gm-Message-State: APjAAAWWP8Jes05qRM0vV4fF+X26xq+cleDD/r2SxCI32qRkdTqIoKSA
 j03U/KgAZTHoD+N4uTfv+qM=
X-Google-Smtp-Source: APXvYqzGTM6O1kzlusq2+UBm7XJw4SAY63lpqMM/UumlDNsXPcBi96eO1OrkgnLHxCGovebuWsNzJg==
X-Received: by 2002:a63:990a:: with SMTP id d10mr1562744pge.63.1582843374849; 
 Thu, 27 Feb 2020 14:42:54 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id a22sm8278610pfk.108.2020.02.27.14.42.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Feb 2020 14:42:54 -0800 (PST)
Date: Thu, 27 Feb 2020 14:42:51 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 7/7] dt-bindings: usb: add documentation for aspeed
 usb-vhub
Message-ID: <20200227224250.GC29420@taoren-ubuntu-R90MNF91>
References: <20200226230346.672-1-rentao.bupt@gmail.com>
 <20200226230346.672-8-rentao.bupt@gmail.com>
 <20200227165504.GA26955@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227165504.GA26955@bogus>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, taoren@fb.com, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

On Thu, Feb 27, 2020 at 10:55:04AM -0600, Rob Herring wrote:
> On Wed, 26 Feb 2020 15:03:46 -0800, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Add device tree binding documentation for aspeed usb-vhub driver.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  No change in v2/v3/v4:
> >    - the patch is added to the patch series since v4.
> > 
> >  .../bindings/usb/aspeed,usb-vhub.yaml         | 71 +++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.example.dt.yaml: usb-vhub@1e6a0000: 'aspeed,vhub-downstream-ports' is a required property
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.example.dt.yaml: usb-vhub@1e6a0000: 'aspeed,vhub-generic-endpoints' is a required property
> 
> See https://patchwork.ozlabs.org/patch/1245388
> Please check and re-submit.

I ran "make dt_binding_check" in my local environment and don't see the
failures. The 2 properties are introduced in this patch set and I add
the properties in aspeed-g4/5/6 dtsi files (patch #4, #5 and #6): am I
missing something?

Sorry I forgot to add you when including the dt-binding document to the
series v4: will add you and all dt binding maintainers in v5 soon.


Cheers,

Tao
