Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6D2BAD62
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 07:02:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cByT3cQpzDqKf
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 15:02:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="LjDdGo3x"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cBtS14YWzDqKR
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 14:58:56 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id c21so15601377qtj.12
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 21:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ltSpkGx9JxwEV0YUbXRmwA8GimmkxvyE+wL0KnnbJnI=;
 b=LjDdGo3xDA+bFpsDVDCpOUcjWct0CQO10OT/rdZD8eqAsA9Ds2qtzBrLWaW1+p9uEr
 PYg6zKMkcKrvU1/Y3WkhTrt+7nMb8BbQS65tr5Coq9loZBGKV1dR5OP/4CloG3yrHs7w
 K7zvTEG/erIPhvzHQdupigotpChRqw8rxxgdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ltSpkGx9JxwEV0YUbXRmwA8GimmkxvyE+wL0KnnbJnI=;
 b=FiBMexmMavrOPZQQiZzskNFSRTc69b3mOVoHxrQrKWxRVdhFcGDSDc8lyTRc8souCU
 m8ZKH1BTe+uafV6mHLjPMVlTCFO9k9shZgsCSz1qpU3AnhRXPq7ZvyJGAAAS8cemTCNx
 B67sZZNC7egdaJY+lkqS2w5ETTvWfENy1wea8RCIUA0YogPGc2yYedxE5knYrl5l/siH
 Ohq/tzWUU/vmLDM2qVQurmbxHCjUibkSwL8IdN47VgxASeizRo+sj6pP9cNNg9iBdPgH
 H/0IgxoWhFf/N+8pOliPgIuNaMT5A0YjyFF58kMMw7HLtOzJmejy1n6wO6c6Y9t2SHew
 TmZw==
X-Gm-Message-State: APjAAAVAAwyR5Gs8bxeVMSEMfA5MmzI/H67LJW9Klgjeo4pjc+21R3Pe
 kqgTVDUqxcwMZbqfUTwrAALVlL8sdA0F+jk0o+c=
X-Google-Smtp-Source: APXvYqywfO6h10D6cluc2ghZjRmmncexRbksh7iN8o9E93bcfir3DDqUThGYOhi/3NaBK+3eF81+JbluqAobSVJBU0U=
X-Received: by 2002:ac8:2f81:: with SMTP id l1mr15696209qta.269.1569214733389; 
 Sun, 22 Sep 2019 21:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-3-andrew@aj.id.au>
In-Reply-To: <20190922123700.749-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 23 Sep 2019 04:58:42 +0000
Message-ID: <CACPK8Xf_ciMEtayQ78yUo=YhrovRMe65xuwviE+DWXDSuQb5-Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 2/6] dt-bindings: net: ftgmac100: Describe
 clock properties
To: Andrew Jeffery <andrew@aj.id.au>
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

On Sun, 22 Sep 2019 at 12:36, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Critically, the AST2600 requires ungating the RMII RCLK if e.g. NCSI is
> in use.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/net/ftgmac100.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt b/Documentation/devicetree/bindings/net/ftgmac100.txt
> index 04cc0191b7dd..c443b0b84be5 100644
> --- a/Documentation/devicetree/bindings/net/ftgmac100.txt
> +++ b/Documentation/devicetree/bindings/net/ftgmac100.txt
> @@ -24,6 +24,12 @@ Optional properties:
>  - no-hw-checksum: Used to disable HW checksum support. Here for backward
>    compatibility as the driver now should have correct defaults based on
>    the SoC.
> +- clocks: In accordance with the generic clock bindings. Must describe the MAC
> +  IP clock, and optionally an RMII RCLK gate for the AST2600.

perhaps: "and optionally a RMII clock if RMII or NC-SI is used"

We should implement this for the ast2500 too.


> +- clock-names:
> +
> +      - "MACCLK": The MAC IP clock
> +      - "RCLK": Clock gate for the RMII RCLK
>
>  Example:
>
> --
> 2.20.1
>
