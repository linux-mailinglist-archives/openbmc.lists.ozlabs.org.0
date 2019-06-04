Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D665B33EF7
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 08:26:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J24h2pplzDqR1
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 16:26:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="JYjMOZ5S"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J23m5r7xzDqTV
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 16:25:39 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id a15so12440054qtn.7
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 23:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jLwXR1He6xHLibKFd9fJTmaVB6caBUD5Pr6b83FpRQM=;
 b=JYjMOZ5S+JtvDr20YW8SEaMagt6fvaQYEwNNaw4R3kila2MpIFThW/TgGhbd1hhJyG
 FEBEPi7T765AuZ0fr9ptorhWv+UZ4W532mJqnxRNdbXsJ35zhNur9Fm2dNmjPdm/KvUy
 UxeVQka2ZK2tfNYV1ujm8Vl6KXw2aDp1McF9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jLwXR1He6xHLibKFd9fJTmaVB6caBUD5Pr6b83FpRQM=;
 b=ErhLxiA+PNF/mQ8xWxid+3ABR4tEFq12TLzXJeBYApsct8ulWb+XwjuuGERi6cKq0S
 zy4ONrkeB62ifTWaxE62DQQjiFpGfMSbJN+EIvyiLGfDpYaF9SDTqzTPdmQxceDkbXFK
 vPqJ+w/Ogwp5CmHKyOMsrHJ6au7R2GtY5mHrUTqQP3IwD8E0rduBfkQ5vM2aXos1WjjM
 xb5B5ZOrU4uF+1OYECZjkDjEF4BCpzv4qPIzILpiBgB+PR1VMN7vxEpxkFWczQsoibeA
 NcFpyYZJMSY1S3YdnYveOO7dVXX0gf0cFZ/TzrKpdrd7C7HfyauxxmSCdtcjyrcMxYVi
 k+rQ==
X-Gm-Message-State: APjAAAVucTGUCMduyt31ccq9wUJbDj6XzTJOZMIq8rKjt3lBweZ+QL4B
 1G2M1fLCEjPiXoGoEorx7eKOyiKZ/hekb6SazV+wqw==
X-Google-Smtp-Source: APXvYqzFn4DzZzRj51EpW6/Fht7H/wEMZuOziJPQR1T9SaM8MEy7VPbaNExRa8KHdjvoxzBQmpvlqp6FLcmeig2Ysrk=
X-Received: by 2002:ad4:44a7:: with SMTP id n7mr23269210qvt.16.1559629537042; 
 Mon, 03 Jun 2019 23:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190531214716.12118-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190531214716.12118-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Jun 2019 06:25:25 +0000
Message-ID: <CACPK8XdU9=QeSUhdQNhdvCH4N0ggD_SNhm4Dtm45CUuWUBtcHQ@mail.gmail.com>
Subject: Re: [PATCH v2 dev-5.1 0/3] Improve stability of Aspeed video engine
 driver - 3rd phase
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jae,

On Fri, 31 May 2019 at 21:47, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:

> Jae Hyun Yoo (3):
>   media: aspeed: remove source buffer allocation before mode detection
>   media: aspeed: use different delays for triggering VE H/W reset

I've applied these two.

>   media: aspeed: add a workaround to fix a silicon bug

Can we get Eddie to ack this one? The justification looks reasonable to me.

Cheers,

Joel
