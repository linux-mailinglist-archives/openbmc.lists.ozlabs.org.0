Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBCD6029D7
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 13:06:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ms9yl46C0z3cfX
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 22:06:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TQGDv7lX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TQGDv7lX;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ms9xq3Ftmz2xbK
	for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2022 22:05:18 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id g7so17076209lfv.5
        for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2022 04:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/6E2oXVLOeFhZFhJlduRtUw6KPU1WI9ajzTuexhM7Do=;
        b=TQGDv7lXU39gmy3rWQuTmj4M/7bvS0HU9kvLBag3HH5/l6pbOoYHDxrU5sLV4jKLyD
         nZw8mU6wtGAIqgab47HMoxW5DBhwHNNRrzFGR7UIs6+xY+uR2rSxTMJrGZLZGl7IyTCS
         6wnqdZQQ5aOkHeebVlXSFt4PaAIq0gsS82KkzSHpbuLXyyftPqlsi7/9PlBgoLZgJaW/
         FSIJqRw0fOIExTvwmjsQMGE33OVrDyb0OmliOw/iBQ5l5ufTq7KGnVZZ51dVGI9LEpKi
         cKUWGhVrJfVmP1133q1xO8lgtEJVKkmJ0luJE7FRrpr9z7wQ5K6+taOvdIbdqDkaxlb9
         NibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6E2oXVLOeFhZFhJlduRtUw6KPU1WI9ajzTuexhM7Do=;
        b=Q/A2kcIq8M9niktDJFsJMXVtFsavbmLsp5o2P/FIgo2g8dc26Na6Z1LnzRr0OXaSez
         yX6Lo/esaz2dbSsZ4+FX1TPj6NBsxuWFaHJyqrG+rD+pAfVJwLX+gvGrXbsKhQh1eWGa
         jSxydxYwkMLyG3QYcqu5gOd7meO/9jKa5oVgT1uAq5SL/2LmcAZ0nta36oizR57zSNxj
         M5VIdNYu5nlSLIOjXz0TOqm0n+H1NkXB4jKvoK/TyLl3RopoDIheMgt2KS0HRS95SiRr
         Hu8nW2YUZRErMbG+GEG9JjplGPptPGZA8/XP/Qv/3CT0xEEkqnyJ/JRTqt+ITSE9kHQP
         qt/g==
X-Gm-Message-State: ACrzQf1/uA0ik1MDoK35vAurEr+llgxwjD+0EhIpBZqRA89mGdPTJBYo
	8zhlqVHqM9EzbZnN2l3X9Lg=
X-Google-Smtp-Source: AMsMyM63uWsew9RrAQE+hvJ6TIzzMiRfQRyLzktKp7/gk+u3UIJwdkwWlesKCHpeUQcjLtOhforRfA==
X-Received: by 2002:ac2:4d2e:0:b0:4a4:7ed0:76c0 with SMTP id h14-20020ac24d2e000000b004a47ed076c0mr753278lfk.240.1666091113789;
        Tue, 18 Oct 2022 04:05:13 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id o20-20020a2e7314000000b0025ebaef9570sm1928472ljc.40.2022.10.18.04.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 04:05:13 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 29IB59kW030762;
	Tue, 18 Oct 2022 14:05:10 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 29IB59xk030761;
	Tue, 18 Oct 2022 14:05:09 +0300
Date: Tue, 18 Oct 2022 14:05:09 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
Message-ID: <Y06IZXkEEQ2zCmGI@home.paul.comp>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
 <34751627996896@mail.yandex-team.ru>
 <df77021c-a86b-1a03-9960-acdf6c324600@yadro.com>
 <9921666089829@mail.yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9921666089829@mail.yandex-team.ru>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "i.kononenko" <i.kononenko@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Konstantin,

On Tue, Oct 18, 2022 at 12:44:49PM +0200, Konstantin Klubnichkin wrote:
> Did you succeed to include this pachset into upstream?

FWIW, we're using those patches on a rather old fork, and they work
great.

But there seems to be a serious throughput limitation for an AST2500
getting data over NCSI. With typical OpenBMC load on CPU we are
limited to about 1.0 MB/s (testing with netcat running on BMC
receiving a file of fixed length with TCP and directing it to
/dev/null), so installation from virtual media is quite slow.

Can you please benchmark your system for comparison? Do you use NCSI
for the management channel?

For the reference, USB mass storage gadget is able to stream data to
the host OS at about 11.5 MB/s.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
