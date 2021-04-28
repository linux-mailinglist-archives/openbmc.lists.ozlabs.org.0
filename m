Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1721536D07B
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 04:16:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVMgW04lWz2ysv
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 12:16:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=thiUDtOJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=thiUDtOJ; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVMgD5h3hz2xZH
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 12:15:50 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id z5so7595219qts.3
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 19:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YaZygZ5aNL1tpjUnTcB01MeD+pC9Bfl3u6XBDZ6GRaE=;
 b=thiUDtOJKEm2GDCJjv2zKA1NgLDlzyHZ+kiiDjFN4//1Rm0ZpSiDYgQ+aO0ayiEsPY
 85ntuHQxhUmEeYokW+moj4EIe3P76UkVTy/GPZ1d/0/PpnV4zekltU2VPJ1W01cOe1Jj
 U0QyVQa6SOomdmR8Zj58yuVUFBTASXrIA5VFQJ58WWeZolP67YCghlnDFZw3yncQvmOF
 FzgCzaFJ4Qy0Kt0MBeJvj3stkHp8N4WrTTn30OOXIvZm9rYOk/0eD4xbVIhohvibz6QL
 twQhO72yF5a7qE+9GVUEDXyxEa2aaGWRPcsir8xXWcZJqgmhFtJB7zxoJ+kz+NWdLWBM
 ksYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YaZygZ5aNL1tpjUnTcB01MeD+pC9Bfl3u6XBDZ6GRaE=;
 b=HVn9R85FggY8NcQXcGjG4DR/QQwU/oHzB6SKUG+3xTaqHH4ezkrQbSRvZzP7FN/WsT
 9FCKzEqIopjAvq6HxwN35HfCwFMgZxiWDO3JfeQTfQkQIH0wj/+n3stemkcimXG6o9i1
 HD4grqBW5amj4dcrGfh5pQgvGhCO13LtdIoPeNg6lcJYdwKREdEtgjaYZIhs0MeX+mLZ
 mfzN8r0lFGXwiyePo5H4joO/W1NGWF9wbnaTthFU0w2Im+vFmTF+6dGf3NI0fMO/fa2M
 c7huUUj09bsRhimLcsmjSxaQEWhW9nwmYPPp/hLz4Oe2W9cz/skNPadZlpXU1yhnJLFy
 Y5DQ==
X-Gm-Message-State: AOAM533G4V71CVw7DjTCqVwlcvFcXmpoSutyOd/+BhBZy4tOi7z48nKN
 vXXIzRhrHqPGmge3wkL5T0AidGsNn+DY7K57ai8Z1d/HTw12tw==
X-Google-Smtp-Source: ABdhPJxPWhObX6SoQbdLIpzOq0v3+dU7wQeu5YLoDrHXoPemnwoqotMKMdFmN3UA3ZrY3TnnxY8jw0fsLa8uxOerBo0=
X-Received: by 2002:ac8:4a95:: with SMTP id l21mr353119qtq.331.1619576146516; 
 Tue, 27 Apr 2021 19:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210218190654.kkdsmrlxgenzr6nz@thinkpad.fuzziesquirrel.com>
 <CACWQX81HtHCqXZCzmJqppR+tBy5xDjBHa_q5gw7YTHZ9UaAH2w@mail.gmail.com>
 <20210219193348.n5e6w4e2vr4sk5ge@thinkpad.fuzziesquirrel.com>
 <47d61387-d71f-b72a-fe30-316a3a37829b@linux.intel.com>
 <20210301150552.hfwsnzgb5wczdpyx@thinkpad.fuzziesquirrel.com>
 <CANFuQ7CaZW6mY11MjYQjk7heq00UuAFgS37JiFBw0WFBCGQNtw@mail.gmail.com>
 <CACWQX80ZKiXJGH58L_1HVGie=CB0+3XD8RJq6sAZhdTq6UadtA@mail.gmail.com>
 <20210310135248.wvy7xwwjhjxe4hlh@thinkpad.fuzziesquirrel.com>
 <CACWQX83sHwbW435Ph9+e2xyPmqxNyih5L=Rs96ydR0mZQOLzpg@mail.gmail.com>
 <20210310154740.qj6wbvqym4utypbv@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210310154740.qj6wbvqym4utypbv@thinkpad.fuzziesquirrel.com>
From: George Liu <liuxiwei1013@gmail.com>
Date: Wed, 28 Apr 2021 10:15:34 +0800
Message-ID: <CANFuQ7BXjb409o=jP+aQVVLKfzJdQOYBLThZgR7Eeym1pXy21w@mail.gmail.com>
Subject: Re: any in-progress Redfish TelemetryService enhancements?
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 "Wludzik, Jozef" <jozef.wludzik@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi All:
Around Telemetry(Support AppendWrapsWhenFull):
I added a new interface and merged:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/41010

So, @Wludzik, Wonder if there is a plan to implement it?
If Yes, Could you share the time cut-off point?

Thanks again.

George Liu

On Wed, Mar 10, 2021 at 11:47 PM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
> On Wed, Mar 10, 2021 at 07:12:39AM -0800, Ed Tanous wrote:
>
> >It would be really helpful if you could add your input and participate
> >in the reviews.  In this specific case, I recall pointing out the
> >missing Min/Max/Average aggregations (from the first bug) in one of
> >the original telemetry code reviews.  I don't remember what the answer
> >was there, but I don't think it got added.  I don't think append
> >behavior has come up, but I suspect it would've changed some of the
> >initial design if we had known it was desired.
>
> FWIW this interest in the telemetry work has only emerged very recently
> (around when I sent the first mail in this thread).
>
> -brad
