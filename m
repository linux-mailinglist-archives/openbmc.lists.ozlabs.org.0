Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC494C9B5F
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 03:47:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7dp16qYJz3bdY
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 13:47:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VPBU/mmZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a43;
 helo=mail-vk1-xa43.google.com; envelope-from=wangzq.jn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VPBU/mmZ; dkim-atps=neutral
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7dnc225Kz3bY4
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 13:47:30 +1100 (AEDT)
Received: by mail-vk1-xa43.google.com with SMTP id k9so200215vki.4
 for <openbmc@lists.ozlabs.org>; Tue, 01 Mar 2022 18:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TRHFTk1EfN4gb8ce2TXomKcYOknFn5p1wjhdSmcMQpA=;
 b=VPBU/mmZGjES2P+dww+qkfb5vMXqqXdokGvU8xmGAkefVaKX0RmFk35u8IpJtAvxwR
 FeAF0VUOdKmWRX6ESENFHE7v+91pynxp4RPf3fj3kP/idWkO/yXAqDiJE03zDYAXbigY
 qtXgnHQTTOROfl9agJWcROusv39L9TRmLJrfim988QWMGtZWYFTp6zdc1u0trtabzNwt
 cmv/pme5a2Y3qxyQXoGx05L4n5mBzYYgd255AG175EGZCPbjZkAGk1v0RRRPYSrS6fN7
 LuVaS3cnu4nSJWaWNg8FeA2JIAZFwyp5l4mdm3fzEr6ukZ7gccPhLt4ULvZyBH60CRRD
 4fPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TRHFTk1EfN4gb8ce2TXomKcYOknFn5p1wjhdSmcMQpA=;
 b=Ch5FzYVuoDHcpYOih74eCjGW6FrgN3HfTt+k8zcWK6qODx+d4cPBI68Gs+1LcdnEW4
 9akXQKt8kDtKDXZu5pYtzjn2qbX40VUpRv5Wdq69uctmbfvVpn/opcAeUX3b6h9jxTTn
 ZtEDfgDZL017tkhvSPW+F40JcjkbohTnJ+bpQTjqohhE3RRyVZg3ka/1mtxR1VJjawLR
 VheLB/f0j9u73sZUs1p2i+Jv90snzwffJMll+oFxl1i+0WmOSwa7oUToCEJkEsCWywoq
 wSU2I0iccYgDbZVPCrrwBWkFiS66nC/inMfNuEXnARwLxmc+tnhbOZcTw2lUfEiPOn5r
 OFXQ==
X-Gm-Message-State: AOAM532uKtD0sx1QQaIcPzcXE6rm5W7zm8GgFwvdsLh0zZ07n382ep8+
 XxGK2LyL5el5kMgc+hXVCW3oOLdd9DZEslx5cOc=
X-Google-Smtp-Source: ABdhPJzuLzZ0MS6sJz09wdZu/qm8AJicw5+NCB27lxvuey2/JGgnYU5jU0bQTKzVBL7opCcdelpNBCyQ0hGTAl0zDrg=
X-Received: by 2002:a1f:430d:0:b0:332:5cc4:af75 with SMTP id
 q13-20020a1f430d000000b003325cc4af75mr11522766vka.17.1646189247637; Tue, 01
 Mar 2022 18:47:27 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
 <b99ecbd2-caa4-c7b3-518c-45477e062d53@kaod.org>
In-Reply-To: <b99ecbd2-caa4-c7b3-518c-45477e062d53@kaod.org>
From: John Wang <wangzq.jn@gmail.com>
Date: Wed, 2 Mar 2022 10:47:16 +0800
Message-ID: <CAHwNHZWFZj+Bg6VLKpdp0PuwO2-gR46vzs28dm0HZmCEyTNuyA@mail.gmail.com>
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Lei Yu <yulei.sh@bytedance.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> =E4=BA=8E2022=E5=B9=B43=E6=9C=881=E6=
=97=A5=E5=91=A8=E4=BA=8C 18:25=E5=86=99=E9=81=93=EF=BC=9A
>
> On 3/1/22 10:57, John Wang wrote:
> > Joel Stanley <joel@jms.id.au> =E4=BA=8E2022=E5=B9=B42=E6=9C=8825=E6=97=
=A5=E5=91=A8=E4=BA=94 13:30=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> Cedric has authored a new drive for the SPI NOR devices on the ASPEED
> >> SoCs. It supports 2400, 2500 and 2600. It is written using the spi-mem
> >> subsystem, which should mean it can go upstream.
> >>
> >> This is great news, as our current driver is half upstream, half in
> >> the openbmc tree, due to some issues getting it merged as part of the
> >> spi-nor subsystem.
> >>
> >> It would be great to have testing. I've created a commit that patches
> >> in support to whatever kernel tree you're using. Hopefully this makes
> >> it easier to test atop your internal branches:
> >>
> >> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/51551
> >
> > tested on a fp5280g2 (ast2500), it looks okay.
>
> Thanks !
>
> > root@fp5280g2:~# dmesg |grep spi
> > [    1.594677] spi-nor spi0.0: mx66l51235f (65536 Kbytes)
> > [    1.728194] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c=
0641]
> > [    1.992733] spi-nor spi1.0: mx66l51235f (65536 Kbytes)
> > [    2.211741] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:2 [0x203c=
0741]
>
> Training was done on both controllers. It's a little faster on SPI1 becau=
se
> the clock is set at KCLK/2 whereas FMC uses HCLK/4. Dual IO 4B read comma=
nd
> is the default setting for both.
>
> I test writing with :
>
>      dd if=3D/dev/random of=3D$tmp bs=3D1M count=3D$count
>      md5sum $tmp
>
>      time flashcp -v $tmp $mtd  # ~3min for 32MB
>      time md5sum $mtd # ~3s for 32MB
>
> but not on /dev/mtd0 !
>

test writing on a 2500 :)

root@fp5280g2:/tmp# time dd if=3D/dev/random of=3D/tmp/test bs=3D1M count=
=3D32
32+0 records in
32+0 records out

real 0m3.144s
user 0m0.002s
sys 0m2.278s
root@fp5280g2:/tmp# md5sum /tmp/test
bed6912a0b257cb7acb79f1c7f99cf6e  /tmp/test

root@fp5280g2:/tmp# time flashcp -v /tmp/test /dev/mtd4  # 32M
Erasing block: 512/512 (100%)
Writing kb: 32768/32768 (100%)
Verifying kb: 32768/32768 (100%)

real 4m12.713s
user 0m1.878s
sys 2m42.690s
root@fp5280g2:/tmp# time md5sum /dev/mtd4
bed6912a0b257cb7acb79f1c7f99cf6e  /dev/mtd4

real 0m7.668s
user 0m0.832s
sys 0m3.524s
