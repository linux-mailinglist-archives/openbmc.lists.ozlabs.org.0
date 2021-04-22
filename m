Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E223682CC
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 16:54:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR0mx6JJ4z303j
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 00:54:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=cIIifwx2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=cIIifwx2; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FR0mj2wxnz2xZy
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 00:53:54 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id x7so45066906wrw.10
 for <openbmc@lists.ozlabs.org>; Thu, 22 Apr 2021 07:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cgl7IGG/SD6JGuzX8YMceSiprYJso9WW9CR3l1Tb/uI=;
 b=cIIifwx2DNo4nxz8nou4f0Dv9bOHS34wD90XtMd8ieObYB4Ks+8WI7dc8msrM53XAR
 rMLDKOklOfqD3oX1VtimZx13OB35ZtnfZzqDRA5RU2v+QlCNTpU1dtn+OBwrcT+/wg4m
 0Cu8S15ycSKTVY0X6QF/y/XvDt+KHQspIpFgcYDeIZIVW2oZ2XwGa36AxhLZuKdHxAUE
 87hHwjZ3QexsJyP9pTf8tPmpi0LTnpEpvk40wsmUiabNWDGcf65pIGaChSU4Qjr+iZVJ
 RMHr3/KePrBoxfBHFg4BT3ruLGgv0GcWMK1BtJclV6DpFBOFzZ4H+Iq38D/LLQSWXNkx
 aDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cgl7IGG/SD6JGuzX8YMceSiprYJso9WW9CR3l1Tb/uI=;
 b=kkYO1GHrJrjoSO8SQaK4nwUxwc83DoOqSlPRN4CX+wOhIdgBgngSWVuemkTiU4j/nR
 hhNdtcvmOOxRJFlDtKst2Fcxz1E1NrEIZoHx59EtJSXUV1EN23xSPq0l9UJSD8TbGsGd
 +5mObuMPqEPBGrlAumXv+GlmFf4C8oQWBce70+B2I/y6qe2vFDsYXrxV2gzuASdoJFyc
 hFyf+8iPw9jUrTEasbR66JNIoBYFUxKl33BMcICqXr4EJI2pIFL6W8Xtdl5Nwjk/eugb
 P5lHhbQfpRNgGX16s7EF6SmQfBUjXI7Ah6kxZ4lFwAIna6Gc1qh+igoVRXg21H2J+pWJ
 mNBw==
X-Gm-Message-State: AOAM530RnowfqtluuGNiqYjotChKwVgNNgBrr2KrFq3AUTLWcr4rimce
 LGqw+Op8sL3byq2oj6BWyzxuDPe+9iJw74sFjFloew==
X-Google-Smtp-Source: ABdhPJxvMrP/fPyK9kZEYt+MCex0hjW46II+X+9OZzV9cUi9+L7WhELEsdyK5OQM184RkfTRQ80Jv6Mafhbmms+0akM=
X-Received: by 2002:a5d:4c82:: with SMTP id z2mr4623519wrs.407.1619103227527; 
 Thu, 22 Apr 2021 07:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210422123001.fb6knneedeqrfgaz@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210422123001.fb6knneedeqrfgaz@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 22 Apr 2021 07:53:36 -0700
Message-ID: <CAH2-KxBB78A=7GTPEpfKBJSGgc=Ei_DaFN0p2F4NEKbsHxJfWA@mail.gmail.com>
Subject: Re: asrock rack layer
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
Cc: Charlotte_Li@asrockrack.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jeff9_Chan@asrockrack.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 22, 2021 at 5:30 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Hi Ed
>
> The folks at ASRock Rack are looking to get a layer added to OpenBMC.

From a conversation with the asrock support folks it sounded like
there wasn't interest in OpenBMC, so I'm glad to hear I was ill
informed.

> You already started this here:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40463
>
> You mentioned the device tree needs to be upstreamed - is that the only
> remaining work item?

The device tree really needs filled out better, which is what I was
stalling on.  I was having some trouble figuring out some of the
device mappings without schematics, so that would probably be the next
work item.

I was also planning on making it entity-manager enabled;  I'm assuming
the Asrock team is ok with that (as opposed to phosphor-hwmon based)?

I also based it on a UBI image, which isn't very standard;  I'm
guessing we'll want to adjust it to use a more common image layout.

>
> ASRock Rack team - if you have any questions about how to help Ed (or
> even take over the patch) please ask here - we are here to help!

Glad to have you guys onboard.

>
> thx - brad
