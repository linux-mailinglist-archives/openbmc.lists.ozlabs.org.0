Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E01935D107
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 21:27:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJzJT0mgyz30FC
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 05:27:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=iWlhBfdg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=iWlhBfdg; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJzJD1tvrz30FC
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 05:26:49 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id x7so14065212wrw.10
 for <openbmc@lists.ozlabs.org>; Mon, 12 Apr 2021 12:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ooaXPg1TDLmHUMpb+3IIJzjyEBSe39uONlUix079tSA=;
 b=iWlhBfdgqyJuOyKejBC1RJzdvptIsXoWuJ4j/Gs7gEF6R5kVax5GJvm/THAhGUdIde
 cG35oI67UwyFNozgJZwZvKnLrSSXJx7Po3CjfTkKhTWaeMYKs3pJyGHeRABH31cQIzo9
 ks5SwhwmTaAdaM87IMiYiWW1hoE25SC42e+F+wJVD2MZeWI/AmvY0xqCdqfPZL6spJga
 KFLSJmrmLzLcL/kLXvofULRrcTCSCu2tt8oMuGsndRY9Px0FXx9wY6NmbRcidRuUZL4R
 Y1s/Nwf8R54whmQsErQQJ5nGq3WnMRXltl/PscNMAXYWjvTmneCJvAB9yaLGUPJ1Q9cY
 oCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ooaXPg1TDLmHUMpb+3IIJzjyEBSe39uONlUix079tSA=;
 b=njlfxA5OvSNjd1Bp/T+sIwFinVlae6JuWTXzaW8Cz3/sTXsdFvXQ1ZY7zHW9VldVPC
 AaxtQXFjv5vErQywVN4s7WRxZvvhummyRAbY0hzQUzZj5EFr8kGQeh7le0H7ONS2i/lb
 J+LAqwkMVwPRvkaHDeGZnmUrQYlK5zSERvhdyHA1hj7XWOMgaGnuMD0nvSzkJiK7PIbA
 enCfQ127Dq0I+J9hxc3Fzu3NqBElE1STaxqkjpNTRSKO+5aSNoDitg05XfQKoScRdyPA
 cLBJnsHFqbn8PS5s+aglYNAFLIQ77KwCs48bCbKfyvjdpKdJym+twVUnclCU+eYeRxta
 0epA==
X-Gm-Message-State: AOAM533TO9YKcWj/X5cDipx+bV8oma3DwtDMXyIHA9DdPwd6lkii2VFc
 mYADvBCWrqKeutZkHbQV4wQpFc756sfLFHwYQ3RqZAPpNjljHg==
X-Google-Smtp-Source: ABdhPJzP4aDsRueqTXqwNY8rOps5osN9QCyj3ln36K7hhxzBx10aBRslp4LEXg/8oxMSPtz1d+wSJZrevGHcdnNLEog=
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr33055462wry.407.1618255602357; 
 Mon, 12 Apr 2021 12:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <cab2988f-76b8-6a30-5fa9-0ee8030af7f0@linux.intel.com>
 <AF9887DB-F6CB-4CE0-90B1-17FEA2497013@fuzziesquirrel.com>
 <bd64513a-76f6-7617-9942-ced892b2c500@linux.intel.com>
In-Reply-To: <bd64513a-76f6-7617-9942-ced892b2c500@linux.intel.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 12 Apr 2021 12:26:31 -0700
Message-ID: <CAH2-KxAe7v2ptH5SEJkd5YeQ-nCo_JQvwCoS5nU=ZLFac+tAuw@mail.gmail.com>
Subject: Re: apply for a new repo "openbmc/node-data-sync"
To: "yugang.chen" <yugang.chen@linux.intel.com>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>, chunhui.jia@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Apr 11, 2021 at 11:40 PM yugang.chen
<yugang.chen@linux.intel.com> wrote:
>
> thanks, Brad.
>
> + openbmc@lists.ozlabs.org .
>
> Dear All,
>
> I'm Intel BMC engineer, we have a module is used to sync sensor data between BMC nodes in one Chassis system. In our Modular system, there are 2 nodes or 4 nodes, one node works as Primary node, the other nodes work as secondary nodes.
>
> 1. Some sensors are only visible for primary BMC, but secondary nodes need the sensors for Fan control.
>
> 2. Some sensor are in secondary nodes, they are needed to show them on primary node.
>
> So, we need a new repo to sync the sensor data between primary node and secondary nodes, could you create a repo "openbmc/node-data-sync"? thanks.
>

+1 to wanting a design document for this.  In absence of that, I'm
going to make the possibly wrong assumption that you're planning on
using IPMB.  In dbus-sensors, we already have IPMB Sensor syncing, and
patches are in progress to add IPMB version remoting.  You might want
to look into those to see if they meet your needs, or can be amended
to meet your needs before trying to push a new project.

> Best Regards
>
> Daniel(Yugang)
>
>
> On 4/10/2021 10:55 PM, Brad Bishop wrote:
> > Hi Daniel
> >
> > Can you please send this to the mailing list so everyone can be aware of the work you are doing?
> >
> > thanks - brad
> >
> >> On Apr 7, 2021, at 1:31 AM, yugang.chen <yugang.chen@linux.intel.com> wrote:
> >>
> >> Hi Brad,
> >>
> >> I'm Intel BMC engineer, we have a module is used to sync sensor data between BMC nodes in one Chassis system. In our Modular system, there are 2 nodes or 4 nodes, one node works as Primary node, the other nodes work as secondary nodes.
> >>
> >> 1. Some sensors are only visible for primary BMC, but secondary nodes need the sensors for Fan control.
> >>
> >> 2. Some sensor are in secondary nodes, they are needed to show them on primary node.
> >>
> >> So, we need a new repo to sync the sensor data between primary node and secondary nodes, could you create a repo "openbmc/node-data-sync"? thanks.
> >>
> >>
> >> Best Regards
> >>
> >> Daniel(Yugang)
> >>
