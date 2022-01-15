Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43248F497
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 04:39:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbP6j566Jz30Q6
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 14:39:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=em+mKrF+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::334;
 helo=mail-wm1-x334.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=em+mKrF+; dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbP6J40BPz2x9d
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jan 2022 14:39:02 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so9045011wme.0
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 19:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P0TTBFSd0pN5y2kR4oYLEYY0FJC47YPzi8ECFmJlE4M=;
 b=em+mKrF+gBvB7WeCaaMtP/sFq0yHvBDbP2U/yFBc5YVLvCfhj/ExddfR+OU9Jgqm2P
 EBa2Giy61ev5LQoZa9CvDIXkAzc305vruSoMrrUvBHdQpAE8OC9P3KLTZgZLSLAE5InM
 qEL0VMcZ58abhvM6tyl5tiw2mluGjEqr3jK8CieuKX3ZnU8EHntY3FcRSdS0I91H4pZv
 QmhJj6Uj3aq5pEaidhBqfXqLa2fRXgk4xQfU599s5gNxfMF8sZJP0jwP0AT0+TOpnjwA
 sfTZkEuoysuIRjUQDu2Yr6n/2vi1M35m8HWznRzNobEIvw3tRVtpP2oPw/dqO3Zoglyw
 wC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P0TTBFSd0pN5y2kR4oYLEYY0FJC47YPzi8ECFmJlE4M=;
 b=tvhwc0G7WZZvEJdzdOACWAQF0mkXiBAPJP5LwAC4euGGpGb+8uP50dMZOUIqu6W7wA
 JHnZsmp6a08/Tf8CHyWAfIkI4CLNlekn9KgXGeT6MdBHcnYBKVwi/QowkP5Fa3IHK07x
 IprNyf8wXf2Irb2TzR6fbeyJL1Y2u1Sk4cqiquAhWRB/1xBoJ/gxSC9H/Ks2uLf7Uw7N
 2c6qwQWykFpglWPSW3wZKQgOnOsKgNBEfjiSOQTwvJzPEAw9YOV/M9bQbJDdo9Vcem8U
 A6bcdX+TxBP1nq5LZ+Mql83QfRDA33Rrsj5yjKWKmtJCrhghQEGHK8Y5jPDY9BMILPRf
 pR9g==
X-Gm-Message-State: AOAM530LPmaoFqmtt454vNgoZIUJ+Xa2lehJlmX5f2hBhffZ698QBjh/
 tWurKFfzgksXdfGQHktYBxUV10GA9mFV5jPStlsbPw==
X-Google-Smtp-Source: ABdhPJzIFYuhN4aCJz9r/8PbfRU98S2AI+q3sXbdICMupuQr0cqLVQhk9Y3gdASRwuDTq0OI4XnXYSfM+PBpJfvqleU=
X-Received: by 2002:a1c:a747:: with SMTP id q68mr17829532wme.98.1642217932945; 
 Fri, 14 Jan 2022 19:38:52 -0800 (PST)
MIME-Version: 1.0
References: <SG2PR02MB27962E46AE874F41055B5F3785539@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <YeHEDNtVqR9Gl8M5@heinlein>
In-Reply-To: <YeHEDNtVqR9Gl8M5@heinlein>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 14 Jan 2022 19:38:41 -0800
Message-ID: <CAH2-KxA+VLeCrJ4pWT1zohvvuWbohhJ7Nr7N9vwd-HgVwfyqGw@mail.gmail.com>
Subject: Re: Redfish collection capabilities
To: Patrick Williams <patrick@stwcx.xyz>
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
 "Udupa.Ashwini ISV" <udupa.ashwini@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jan 14, 2022 at 10:42 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Thu, Jan 13, 2022 at 11:47:11PM +0000, Udupa.Ashwini ISV wrote:
> > Is Redfish collection capabilities (https://redfish.dmtf.org/schemas/v1/CollectionCapabilities.v1_3_0.json) supported in OpenBMC?
>
> https://github.com/openbmc/bmcweb/search?q=CollectionCapabilities


Patricks answer is the way to go for finding the answer to your
question.  What are you trying to accomplish with
CollectionCapabilities?

>
> --
> Patrick Williams
