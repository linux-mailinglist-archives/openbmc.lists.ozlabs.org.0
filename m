Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFA22C5EEE
	for <lists+openbmc@lfdr.de>; Fri, 27 Nov 2020 04:27:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj0S320YCzDrSc
	for <lists+openbmc@lfdr.de>; Fri, 27 Nov 2020 14:27:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=in56Pjgq; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj0RL09fSzDrQq
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2020 14:26:51 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id m65so2439080qte.11
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2020 19:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9WUrZoQWIVQmEf8bTG4yI9jOrYCIvvoq5KBUqham1P4=;
 b=in56Pjgq6Uj14raKrHbAZ2Jd9lSUAutcT61oOAmkYKpQjtymOIkvnJ3Lbqf/zmeXr4
 xjbWLbCYaaFHY4UGwz23t9lRg7FKTks2XNo30UisOrTXKJLsAdB7xrhhaDJSlsH7zicI
 wZ4nL1+YNAvmTTCNqBXm8XVjGvp6FDzybzLqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9WUrZoQWIVQmEf8bTG4yI9jOrYCIvvoq5KBUqham1P4=;
 b=nfXqMxGSxLj8YwmJa+yqQmDrooWEdzuwSO82s6cqyO6h6tRGbuTPoNKNZDb97B2I3+
 TRgZNvB4q4GxX6odUoBSGzVzwa/4tFraeHbOgEEq3/3SCpiXI7M99wFH4v1lHLU3zGzI
 1KcqzfHVXx15korYHk2YvE45u9aMWI0G7KSGi+rwLbYjq4eIlckW2grKwj0f2SkEaPUy
 9IeggZOoKwllRhKZdlelRNCVEOs9lSAFFC38IVeZSQY3/lE6JfidpF2JOPA/eBWp0se+
 0Q7HT2Z4RFKzT4sF0OWv57Yho2hIid5+n0v7q19q5c5hZCkNit0c1n4XphALasTZUind
 vpZA==
X-Gm-Message-State: AOAM530RIYpMKp6Jir38NENUKFnapqJdqNKSEHcIZgqDth4rEwf03tp0
 AvlouU4Iv3+L/+JJfY2n7YxIht/yKITEE5hCmfs=
X-Google-Smtp-Source: ABdhPJy0ArOLo5QFpXjY8mvuHvcOMeoDUjjjnNzdkfgtO+X69xckmuVFlDcU21290uI2QMQtXoYfrGpkgfeHvg/MJzg=
X-Received: by 2002:ac8:37e5:: with SMTP id e34mr6301708qtc.363.1606447607779; 
 Thu, 26 Nov 2020 19:26:47 -0800 (PST)
MIME-Version: 1.0
References: <20201127024158.1486-1-quan@os.amperecomputing.com>
 <20201127024158.1486-2-quan@os.amperecomputing.com>
In-Reply-To: <20201127024158.1486-2-quan@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 27 Nov 2020 03:26:34 +0000
Message-ID: <CACPK8Xe9jSu3WctwbT5B7mB54jCKt2gHL27441xd2oJGapP=Uw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: vendor-prefixes: Add an entry for
 AmpereComputing.com
To: Quan Nguyen <quan@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 27 Nov 2020 at 02:42, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> Add "ampere" entry for Ampere Computing LLC: amperecomputing.com
>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
> Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 604166ecaefb..1887cd5687da 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -99,6 +99,8 @@ patternProperties:
>      description: Anvo-Systems Dresden GmbH
>    "^apm,.*":
>      description: Applied Micro Circuits Corporation (APM)
> +  "^ampere,.*":
> +    description: Ampere Computing LLC

I think this file is sorted alphabetically. You should follow that ordering.

>    "^aptina,.*":
>      description: Aptina Imaging
>    "^arasan,.*":
> --
> 2.28.0
>
