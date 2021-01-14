Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F04262F6BA9
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 21:01:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGwDp2bVCzDrQj
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 07:01:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=SpiUdYhP; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGwCz50rHzDqvv
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 07:00:45 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id o10so606035wmc.1
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 12:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tmhzzP7aWLIr6wRcsuShNEmR59EZU2OMGi3SCQ0rct8=;
 b=SpiUdYhPTfM+tBTFhaT2jemWqjhqbrNCaL6ZjBsCTzwhlDH4zZ/FT+EtMabq2j7T7t
 VmRLGV+sMaGNRe2CTrTiZm0fBFx9EDplJAI+DQVHVVdofkGhvHc/0VtPsxiWrg/zGzId
 c6zvdR9dMs3qA/1ftBE9krHHe4YoxDlczUmc5McBU/4CV5LWSsn0qnveUM1tnrYusT60
 /JCyX7ytOEjr9/j1bny0bqpWC6P4K6mozLsCDZCfdqu7Mlvpn88IqDjs1Lp1KsYE2u44
 WXC/dH0491mQ3oPm+AxQSsXOqUYp88caLU/mO/B6sVnRPDsQGX5ZOaGJ2aVg48eiXQnr
 KoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tmhzzP7aWLIr6wRcsuShNEmR59EZU2OMGi3SCQ0rct8=;
 b=MbhPyI2nHSbAre6MzfLi1iD6qZxk8jUvHa/216v/mP23mlSndiWhs6ntcNDe0IVYXj
 iTQiDEJtX7WnPX7iSLmH6QNrY9obS9gHKw/rMyBS5Ld3vV34s6xzFgPiwD9CeiA0hTOA
 MdyzdrXfsQfLgjkHb/qo3LpukU7b3NF5ICL/8L9Q2cm/gYLZWmAIsW6yHZHjDSUZZtem
 7y2B9HTW0+sjXONJ90NMZfSWDk9lhAQ2lSRl4vAS+lmRxNNU9NJziyCRaJji+y8eF7Jr
 JYwCVZlyUFuqapTXIXqE0xpRds2YNcZIAQCPSWvGga6Fr6dtHvVQ7X2pr/PI1k8lD+da
 a1FQ==
X-Gm-Message-State: AOAM533vdlMZmdmmDD23Zj7LYXN7jo4FIUQPZZldnOs1vcIxWxf7/tEq
 okaoPWLh1fm0XoqxLFT//dsJLCL8EnGqTqcep8fk4w==
X-Google-Smtp-Source: ABdhPJzwczxbLTmV8UahNbNZkUDROufOG2ig4TngPVYcB3axnlZ0B67vtF3yYndG6zXxB6H7KCGsnBJNSdeMLINv0Ww=
X-Received: by 2002:a1c:dd83:: with SMTP id u125mr5340302wmg.93.1610654441417; 
 Thu, 14 Jan 2021 12:00:41 -0800 (PST)
MIME-Version: 1.0
References: <CAHwn2XkNiz7rZzn9RbpZCaUM8HD0HO+mJTD9D2ENc_p+SsmXHg@mail.gmail.com>
 <20210114143909.jf3vbk7zhxp3iguv@thinkpad.fuzziesquirrel.com>
 <CAH2-KxBgmEmfeQxsbTa1RPVO_nm5=G+ayZ9aDM+1hf7oRtoDGA@mail.gmail.com>
 <20210114185316.vmlaa7nn7vlxq2wh@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210114185316.vmlaa7nn7vlxq2wh@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 14 Jan 2021 12:00:30 -0800
Message-ID: <CAH2-KxBdFnpxP3frtmSKrwq4ZF32+meSEiBoWPLOLLMSOKYXUA@mail.gmail.com>
Subject: Re: Intel-ipmi-oem repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: Willy Tu <wltu@google.com>, vernon.mauery@linux.intel.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, chunhui.jia@linux.intel.com,
 apparao.puli@linux.intel.com, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 14, 2021 at 10:53 AM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
> On Thu, Jan 14, 2021 at 08:38:41AM -0800, Ed Tanous wrote:
>
> >I only suggested a new repo originally because today it's a separate repo,
> >and the long ago patch to add it directly to ipmid got the feedback that
> >was too different than the existing to go there.
>
> Hrm...this is not at all how I remember it.  I thought the feedback IBM
> tried to give back then was "please don't break the code that is already
> there."  I apologize if what came through was "your code is too
> different, no thanks" ...that was definitely never the intent.
>
> -brad

I was only tangentially related to the previous discussion, so it's
quite likely I got some details wrong.  Sounds like we have a path
forward that doesn't break anyone, so on that front, I think we're
good to get the work done.

-Ed
