Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B16E33AD7F
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 05:19:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MdfH0pWYzDqN2
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 13:19:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::131; helo=mail-it1-x131.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S3s4nJw6"; 
 dkim-atps=neutral
Received: from mail-it1-x131.google.com (mail-it1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Mddm4xYhzDqC6;
 Mon, 10 Jun 2019 13:19:08 +1000 (AEST)
Received: by mail-it1-x131.google.com with SMTP id j194so4150318ite.0;
 Sun, 09 Jun 2019 20:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7XYb+4GxeLCvzTEWpmiBlGhknWybwTP9EedoL+YKPIM=;
 b=S3s4nJw6DtmamcAM+1aqzBez2m1BJ490m3r5aSUnsJl9HCEwWWbMlC4r/sMmS8Gbg/
 +nCWXzhiM8Oc4s1eS48evEzWNidMkaJ7x7Lx88vLg+fb/rhULmSfQq6aAlRUFCGmMctT
 0K8ZP8BOSDQbDY/M6YP7j2tSt2EXfJn6ppkMg/+rSJ2c8mwq6z/6PDumNfTRWT/cYZYa
 xnfba6Fmt94CfnxWoQANCTrHfJHeNhj8BwcE7VJdh/tEuGkrddluH9dCLDWcnvqKttDJ
 Os3tw99bjS/R4IwHVXbXs+mnOHMC6BTSV7pDZz2EpM4Ro00twYsccLE0r0S9t1Ta9bcS
 YWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7XYb+4GxeLCvzTEWpmiBlGhknWybwTP9EedoL+YKPIM=;
 b=DZBU6TJjIsttCRjTcD9tkGpvRKGSqOBqOCUuNTuxu6N19HjbU3OaS5PBr9cpEtsZQi
 DHnmv7KR6TDO+QvQWhEfq6JE3vN4jms5k5N1lhBUQ5gst+ZhoXKUErixDdrz5kjbTjyu
 oCozlO/EfRxLZRY8/L2VGAMQZj9rb4OWVgrtuS7oYUqpEhyF2KNn6NTaSy9ejF6/53Ao
 klxInkzFX369FNlejG/u6sZF8pPR4H3NdDLXTtCSaCDVnc3qNh3P5Lgd2o1DooHYepVT
 HrRGbcdw6a36bXzis7u4hnd8ZdxocmxCFPnQkrEa27TNWppFZotb4dQhx0usx+AUNTKa
 3gJQ==
X-Gm-Message-State: APjAAAX3a+CbKU1HI2r5QqlT3eBY6ITLpEgUCptBLlgEJ6qEjoJ692Xn
 aOgmiTqMYPPw37da8GIpHcFFMhvP/ijLjGUN3JKik5V9RjP1gg==
X-Google-Smtp-Source: APXvYqzPs6q4cpT7NXZ3tT5Y24IeXYuzVxmzM8Hbp2k54Bc1/l98nMQ+nKU8MSneqSsXmpPPYfIYT7XDVwkrJBk9aAQ=
X-Received: by 2002:a05:6638:149:: with SMTP id
 y9mr19508708jao.76.1560136745009; 
 Sun, 09 Jun 2019 20:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <20190604182635.GD46814@mauery.jf.intel.com>
 <CAARXrtnpeP0J3T0y=K=O1QTYjxBXXxQSzUVErygzUo+MR6t=0w@mail.gmail.com>
 <f1d99c51-881e-c1f3-79e6-1d9be951b0c4@linux.ibm.com>
 <CAARXrt=6DwO7cAxyEJ=FEUPF4+gU9npJtWmd31LuqmTpxHu98w@mail.gmail.com>
 <b20a0ffd292efcafc8e4ebad40d810bc@linux.vnet.ibm.com>
In-Reply-To: <b20a0ffd292efcafc8e4ebad40d810bc@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 10 Jun 2019 11:18:53 +0800
Message-ID: <CAARXrt=ifx2E=vQ-Pm2nMUW586qq_1yp0aOTO+2XjiaXERGZkQ@mail.gmail.com>
Subject: Re: [Design] PSU firmware update
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> I see it as having a single tarball file that has the required files to
> update the
> BMC and the PSU. When this tarball is uploaded, then a new Version with
> a Purpose
> of System or some other name is created. When this Version is activated,
> this
> triggers the BMC updater (existing) and the PSU updater (new) to check
> if all
> the necessary files to perform the update of their component exist. If
> yes, each
> updater updates their piece and if any one fails it'd mark the Version
> as Failed
> (TBD on synchronizing the updaters to mark the Version as Active or
> Failed).
> So the PSU would be updated at the same time as the BMC, but done by its
> own
> updater application.
>
> Thoughts?

A single tarball containing multiple images for multiple purposes is not
implemented yet.
So this design doc is expected not to cover that, is that OK?

As long as the PSU purpose is implemented correctly with the same interface,
it should not be difficult to support it in multiple purpose case.
