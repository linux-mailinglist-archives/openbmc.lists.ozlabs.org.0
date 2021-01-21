Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F582FF0DA
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 17:47:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM7cC0JRNzDqpG
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 03:47:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Y3rKNSpV; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM7b52G2QzDqlK
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2021 03:46:56 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id o10so5263994wmc.1
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2021 08:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zJIgnjDiLRKj74YaKnIIQWdNRlHKK+gLPBNta9W0nws=;
 b=Y3rKNSpVNjSoQMM21Lzo0v67kh6Hsg+P/aZlyToVNXhj4h0PAVmLaa8aWo67sU9jcA
 0P8lDf0OGnrpcR6V0s+SbRWAmYVYaiahjvzDLqxtSk33jOtmBS55bfaqaz+VRzGq2t8x
 O3OEu2g0glYo2B55+9L7MlUdxLz0GDUWMAedFHJZJl6An4pMgzizgsyD13seAyoioJtq
 GF4CLR2QR/wk46+S4OyqoQPOXn5X25Ny61jmLSbQ9gFJOT2YklhFhORAgaaiTZ6qEqvT
 tHeTw60Xr3z0M6bsu6HfPEibiSHyG97rqncDENvcimJeSVCmC/f3JDHl893wIUoGAulu
 bmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zJIgnjDiLRKj74YaKnIIQWdNRlHKK+gLPBNta9W0nws=;
 b=jEu3Z56EeRyghpuSVUZwP7ek6Amby9pphcp8fqxCPPPpc/w1gYD64RP9rLNbr1aew6
 xirnISWxxUDNPnGDSnUlvnrmABl50yNw390wqIsch2gPT6dtq2S/mlXTkYL4pAk+l+UW
 XzHqmzO9Itja1KM/XMW8WCQIbdkKtDnUz3D7D51hzbLtOAy/I/q0gVAkvji4Me/qhBGJ
 Z7orBlO62wsEf5QUJiUHveJ9le+B9Kmf6vpbTSL82fo6ReGTTxIRVhZ9afuKcC44jOMW
 p4zwyxbUtchTnpmCdF4Jc035zzfgYdfif7DScjR5vaFYNDoRCZ1/+HqLSC5duk1UYfvG
 ElbQ==
X-Gm-Message-State: AOAM530ut8XIeGduT/4D5oNs5vq7xSn37b0WMEyR66Dyq6zJysZsHVkD
 HYy386Vhzc/paZn6YWVbuWfrAN3Pl9r2t1utUYe0V1M7qZ2hcg==
X-Google-Smtp-Source: ABdhPJzOmLpLnmBR7I1f5Jeot+nO8Cg8Mxkgriwm4p9Drlu78MvDNqvVkQmftN0/U2AwLW172Q2hzBIzEpSjLYjDLzU=
X-Received: by 2002:a1c:740b:: with SMTP id p11mr266477wmc.34.1611247612451;
 Thu, 21 Jan 2021 08:46:52 -0800 (PST)
MIME-Version: 1.0
References: <9d53ed62-7d4f-6c0a-a52d-34ae690d84e8@linux.intel.com>
In-Reply-To: <9d53ed62-7d4f-6c0a-a52d-34ae690d84e8@linux.intel.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 21 Jan 2021 08:46:40 -0800
Message-ID: <CAH2-KxCY4bHin6yQELB9dKPcSZsJUMM61k2FLSs+hVcYG6TzgA@mail.gmail.com>
Subject: Re: Discrete Sensors in OpenBMC
To: "Wludzik, Jozef" <jozef.wludzik@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 19, 2021 at 6:23 AM Wludzik, Jozef
<jozef.wludzik@linux.intel.com> wrote:
>
> Does anyone use or implement discrete sensor in OpenBMC? Redfish defines
> discrete triggers that use discrete values to detect that threshold is
> crossed and trigger action should be commited. Redfish does not mention
> about discrete sensor/values in other topics/schemes than Telemetry
> (e.g. MetricDefinition, MetricReportDefinition and MetricReport). I am
> asking about it because we are trying to find an example of discrete
> sensor to proceed with DiscreteTriggers implementation (aka Discrete
> thresholds) from Triggers scheme.

A "discrete" sensor is terminology that's only used in IPMI.  The
equivalent in Redfish would be an enum type property, of which there
are many examples.  The most obvious discrete-like sensor that we have
an example of today would be the Systems PowerState parameter, which
changes state based on the power state of the system.

If you're looking to stream events through redfish, generally you
would implement some kind of property, then you would implement a
Resource Changed event that someone could subscribe to from here:
https://redfish.dmtf.org/registries/ResourceEvent.1.0.3.json

We don't have the subscription part implemented yet, but there was
some talk about getting that going.

>
> Ref.:
>
> Redfish Telemetry White Paper -
> https://www.dmtf.org/sites/default/files/standards/documents/DSP2051_1.0.0.pdf
>
> Thanks,
> Jozef
>
