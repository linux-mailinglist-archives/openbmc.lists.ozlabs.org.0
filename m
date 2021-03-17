Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F423C33F986
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 20:45:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F10xt6k25z30LJ
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 06:45:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=hno/puq0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=hno/puq0; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F10xg02QSz2yxG
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 06:45:25 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id j7so3069634wrd.1
 for <openbmc@lists.ozlabs.org>; Wed, 17 Mar 2021 12:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z6A+nhSnrCGFFql5uFErz8F9OcVsqwuN3zoZ3Lf3vsI=;
 b=hno/puq0HUhKZ+GYd5Nt1MQCGeQJFLo0YlAr9who6r+j6j6TBiPtfAfnDOmLrOzrjY
 ob3EM/vjt16mX8VgrLAOj25Jn8ux773o9B1XCpzm7EBU31u6fP/lXFR2tcWaj9A5Gqfv
 YnwIkpe67steTWSACVFx9jL4CfLq8HHkNRyEhNYVTUY+ih0+LJgvv6jGqN8n3N/LhIT1
 EMH+kIl9rF5RMLcN4Wc16kkZTMzAZExHomUDs7ZsK/cwDTQdUIjiEeMITJBAhm/19SyA
 A9FZf7FmQSAmM031wPlKHD6ztKA2FwempGpUJL1qWYAVPyASRXNwyUnHWPBDR9IWyyWr
 AGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6A+nhSnrCGFFql5uFErz8F9OcVsqwuN3zoZ3Lf3vsI=;
 b=ijg0JeB312fKTRMqPJLLcfqzSqetv2Ug3EpcRjoHzrZoyCp3JNkQy1ZEUDrnKX0NcO
 leEyQ13Osh1L+z5u2MeyDaiyIxyBFmBgIqrbVIydBkCNptn8zEa6f3s1aWyFVq76/2A3
 WG31mXVVkPtApF1LfW3xBshUlHQvhJQCyNM7nmZJ6D6tWegtYQ1ITvIG/oZYIZKMsokT
 4Pe5QsrI2QwjzLfqAbEjUSL1KZvOCudH42tlb/zm8ivlSTIhtwxWQeCDKIH96CbdUVJR
 igqlIac6MWxRL8HF0FVRcBFbmuAS4mr5dPJX8bsT67apBIUakNIVwYpZV+xGUSa2NDru
 wV/w==
X-Gm-Message-State: AOAM532HbTZd5oe7x8dcLmltzEMwyDwfGxt1cU5MPoQsHGM0kORmp27l
 jP/9vl4YOqxpzJy1+jP6wGzIasmipYXNqmGiBxoBSw==
X-Google-Smtp-Source: ABdhPJyduhtAFhWK+foEG18zwKXg3klKY/lcm7v8nBtJup/zQmM5ZzdsgxapRrkS/XiWaOA6MdF0Dmf/Sa1m6ehg9jY=
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr5974886wru.366.1616010322592; 
 Wed, 17 Mar 2021 12:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <925a9eba-db8f-fba0-7d17-db32860c44ba@os.amperecomputing.com>
In-Reply-To: <925a9eba-db8f-fba0-7d17-db32860c44ba@os.amperecomputing.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 17 Mar 2021 12:45:11 -0700
Message-ID: <CAH2-KxCUYzjckT7xEAtcdV4Q_2h4B7GdAcXw_TTqBA6O76Q7Ng@mail.gmail.com>
Subject: Re: Where to collect information for Redfish System's Processors,
 Storage, Memory data
To: Thang Nguyen <thang@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 16, 2021 at 3:22 AM Thang Nguyen
<thang@os.amperecomputing.com> wrote:
>
> Hi,
>
> I am looking for how to support Redfish System schema which information
> from Host:
>
> - Processors: redfish/v1/Systems/system/Processors
>
> - Storage: redfish/v1/Systems/system/Storage
>
> - Memory: redfish/v1/Systems/system/Memory
>
> I looked into the bmcweb repository at redfish-core/lib/memory.hpp and
> redfish-core/lib/pcie.hpp but just see doGet() function to read data
> from dbus to report via Redfish. There is no doPost() function to post
> codes to Redfish.

Today, there's no way to do this sort of Redfish POST/PATCH for normal
BIOS use cases.  I'm working on a design doc for how to add this (via
redfish host interface) to bmcweb.  If you have any ideas here for how
this should work, or requirements for what you're trying to do,
please, share.

>
> My questions are:
>
> 1. How can Host BIOS collect information and send to BMC so that BMC can
> report via Redfish? via in-band Redfish?
>
> 2. If the information is not from BIOS, how can BMC collect information?
> What recipes/repositories are used to collect information?
>
>
> Thanks,
>
> Thang Q. Nguyen -
>
