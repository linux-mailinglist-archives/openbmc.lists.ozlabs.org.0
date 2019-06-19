Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 202464BC05
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 16:48:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TSVX1fNtzDqwC
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 00:48:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WsN6TW1n"; 
 dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TSRY5YnZzDqqY
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 00:45:29 +1000 (AEST)
Received: by mail-io1-xd31.google.com with SMTP id e5so38815296iok.4
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b0CVY/MHxl5q8Uk1GJgPKSP7kcJMbdIiYUvxcrcVm6Q=;
 b=WsN6TW1nH0pe+KJSmbhs+nHEFbbNHiQzlwfavAh5LIKMiZ10BoBks4xX1xAcByKMIh
 XJAiZF9qC9RM1Wh6GckXzsBjd0fUrC83s3BUQeFYyoAeNb4ArnxUmlzQ+Ki5+bdxZSUB
 ddy//Ocv67tXz8mgEngnkNWfdM5SlsouuniLqY8v40hn1lVVIq8E3lGZnOFv8qmEZSNE
 sz7XTQy/kkXPdzYvarQoMGF3fstshnSdV5q6Ay0IOVpEkk1lvK0s2+pzwAzADiH8hosy
 RxhO1dNoq9WIGMJFxfh7Xqm/WFb1har2j60feI4JU/AD8ItL7XMt/KnmIRSmbrEiynOP
 CXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b0CVY/MHxl5q8Uk1GJgPKSP7kcJMbdIiYUvxcrcVm6Q=;
 b=jLBOOylCKH43tGVSyq3F+CoF6FObpwsayBbb+noV7WZWNpu8UPCmYgKo3XfWsPwPng
 ty5L098yQwLuLaFZeA/XDpmIEp5N7Ht1moqu8OhSke9AfT09EDWTozEt2rLSO/Hcrk7b
 45UTvsbvUOS56x37X8jqmaeCEq4cw/USveUDCDjMvsM3kS4KzVgj+Nurxii+qlpqyFR/
 IopI8HygREQ6uIedi3nw62mE696ta6KtH2BobU6bzqJWaJxtSNUOGO1UkGWt9w9TQbO1
 cj9nBNq3/S8oS6AFzfLNudxa4R7POhkqwxD9uTeYtk3T/KjYrQpJ3MSz8fzaz2QOgxVH
 xKrw==
X-Gm-Message-State: APjAAAV95cehvRPx17T6P4sWMRY17FMZ2Iub3yHYPTKNp6MINnI8Hd/L
 mk1Z3PD3HchfjfBsPhI6xFOPB2nPwm6IqyQlM4Q=
X-Google-Smtp-Source: APXvYqxeVhjctxb4KErrzImxJxBc1YMYjgOLf8YpGBHMtk20lLMD5/sdaPQ0iPCv/rdzLHZ2gAtMYFfbTXKn5Is4rCw=
X-Received: by 2002:a5d:960e:: with SMTP id w14mr7137223iol.189.1560955524545; 
 Wed, 19 Jun 2019 07:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.3250.1560532343.4162.openbmc@lists.ozlabs.org>
 <tencent_69C7E9EC6F65C50D0F925BFF@qq.com>
 <CAOUmYFRYB3i_-sLBMbmOXJX3-Lo49QjfK2G01XFHbj4Mndx4sA@mail.gmail.com>
 <CAMTupoQ9fovzOcFH__Ljq=y8RKAp8_7WYunzQ8xNcc6Qjk+Dvg@mail.gmail.com>
 <tencent_799D81715559779D478D3D61@qq.com>
In-Reply-To: <tencent_799D81715559779D478D3D61@qq.com>
From: Derick <derick.montague@gmail.com>
Date: Wed, 19 Jun 2019 09:45:13 -0500
Message-ID: <CAOUmYFTVYjXwXP_oC6+yMUaUS8d15=Ys5BDqGjc-N5JBQC8HQg@mail.gmail.com>
Subject: Re: Re: Network Settings GUI
To: xiuzhi <1450335857@qq.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, rxsun <rxsun@zd-tech.com.cn>,
 Jandra A <jandraara@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> The IPV6 webui should support both IPV4 and IPV6 on a single interface at the same time and users can set IPV4 and IPV6 on the same network webpage from Lenovo test cases.

Thank you!

>  Ruixia (her email: rxsun@zd-tech.com.cn;), form my team can do  front-end development to implement your design .  It would be best if the IPV6 feature could be achieved in one to two months.

It would be great if she were able to join our GUI Community
workgroup. It's every other Wednesday at 10:00 Central Time. We use
these to discuss all the GUI issues. Where are you located?

GUI Community Workgroup Wiki:
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
