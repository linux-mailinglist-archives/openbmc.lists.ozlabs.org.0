Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80685641B7D
	for <lists+openbmc@lfdr.de>; Sun,  4 Dec 2022 09:19:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQ02X2KSjz3bdl
	for <lists+openbmc@lfdr.de>; Sun,  4 Dec 2022 19:19:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Pn0MdT7j;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Pn0MdT7j;
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQ01z1tZbz3bXR
	for <openbmc@lists.ozlabs.org>; Sun,  4 Dec 2022 19:18:45 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id n9-20020a05600c3b8900b003d0944dba41so3025569wms.4
        for <openbmc@lists.ozlabs.org>; Sun, 04 Dec 2022 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y8TCyPScLpghS6e2mx+sLfq31ciUW5bDY6CEPjz88mY=;
        b=Pn0MdT7juBzqq3X5Hi+ioCzx3cHMY4Eb6UIzyYby6bb/e5ksSljVgNiH1UgDrQo7Ja
         WNEnlWHKeqM8+1PnIanzZogBF236USdFuV8QhapM3fNFw6vRTR2BzhJ0wON6zINUlo3A
         zy7OcrwZD58WajxqAicnGOQCjfKCAqRf+TVEoWfF950JYKe+yoXpWAD5AIuxQ9Rq2JnN
         YMqmSuXpy/UUNjmALXk7YDTpgOFW6JrqE5N/UqxUryfN0ZKLcPC9Z6zvuH3uAKd/ZiiF
         zP21atiUT3b8bAA0ic3Q3xStIATyBfvqd017MgEj7ji2yr3vfINaU1Zgallp3rITHY+T
         K0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8TCyPScLpghS6e2mx+sLfq31ciUW5bDY6CEPjz88mY=;
        b=xqYK9ij+TltX41avXxue6BFvaO/0ockVl0pFbqsnCKvOZuqKChA2Ft4CXcPHCuDZ6t
         jrvieS0RVZpsM/61SGGs01XqDcXPAmIhW1zK5PJyOY3yWMWf+xZsaNuSXpyiCtDQnrqQ
         izz5b9br9lRkFBfFI4BlqDQSrUDgk5d7l+GsoJ0by9qBVnM2x6cqVxL2I/q/Tv5AKjr8
         PTh249E6GoyQNdSzE4aatUC606OkBX3HQfTeMALl+LYF98wmGTrxdMIyFzcobXUkLpJc
         DxHglktCm2D8anPrU+NaVRLSHh5aIdx5ZmYpN5I6TNp15vxOZ6bmXp72oMgsg0F/UVwQ
         xPEw==
X-Gm-Message-State: ANoB5pkjty3lrImADN33b9o6/nWNdVA7brl6Uq05EgfYWPdU6tSHhR0J
	19xpWoBHRZDutPXrZTiz5WPSlHd/3m21SYQBrL7lwwSE6U7s3HgJ
X-Google-Smtp-Source: AA0mqf5icu7a0bwe0PH4mhgZikiQ6M5Segjx8J4gPyyBsciZvfT4KC0hiMHfsqaDK1zuEmbd1PJ/Kf7ybDrCrecevHA=
X-Received: by 2002:a05:600c:1e12:b0:3cf:9ad3:a20e with SMTP id
 ay18-20020a05600c1e1200b003cf9ad3a20emr47012448wmb.151.1670141918605; Sun, 04
 Dec 2022 00:18:38 -0800 (PST)
MIME-Version: 1.0
References: <CACFAz8BpHQUROFcpG3+dG3XyUt0+8=zgcwkU4CTk3uuO0Z2c_w@mail.gmail.com>
 <44e8a1b5-22cc-1599-4f1e-5071e42fba8d@baywinds.org>
In-Reply-To: <44e8a1b5-22cc-1599-4f1e-5071e42fba8d@baywinds.org>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Sun, 4 Dec 2022 16:18:27 +0800
Message-ID: <CA+J-oUuZzkzuuwAJ_tfrcTk7dxvTj1Pr7QW+W-HJB1Ka+yuXTw@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] Re: Changing ethernet port speed
To: Bruce Ferrell <bferrell@baywinds.org>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Bruce;

Where are you want to set the duplex and speed?

For linux, I use ethtool. See:
https://phoenixnap.com/kb/ethtool-command-change-speed-duplex-ethernet-card-linux
For u-boot, I think you need use `mdio` to change the register of
`phy`.(I'm not sure if any better way.).

On Sun, Dec 4, 2022 at 3:10 PM Bruce Ferrell <bferrell@baywinds.org> wrote:
>
>
> Normally, those parms should be modified with ipmitool
>
>
> On 12/1/22 9:27 AM, Hamid Amirrad wrote:
>
> Hi,
>
> I am trying to change the Ethernet port speed from 10Mbps to 1Gbps, but I can't find a way to do that. Can you please point me in the right direction?
>
> Thanks,
> Hamid
>
>
> ast# version
> U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)
> arm-openbmc-linux-gnueabi-gcc (GCC) 11.2.0
> GNU ld (GNU Binutils) 2.37.20210721
>
> ast# printenv
> SN=8513060012
> baudrate=115200
> bootargs=console=ttyS4,115200n8 root=/dev/ram rw
> bootcmd=bootm 20080000
> bootdelay=2
> ethact=FTGMAC100#0
> ethaddr=00:02:C5:38:1D:DF
> ethaddr1=00:02:C5:38:1D:E0
> ipaddr=172.16.141.104
> spi_dma=yes
> stderr=serial
> stdin=serial
> stdout=serial
> verify=yes
>
> ast# ping 172.16.141.1
> FTGMAC100#0: link up, 10Mbps half-duplex
> Using FTGMAC100#0 device
>
> ARP Retry count exceeded; starting again
> ping failed; host 172.16.141.1 is not alive
