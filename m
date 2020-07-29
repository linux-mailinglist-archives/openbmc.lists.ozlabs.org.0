Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 461C4232819
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 01:30:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH8sx4Q1NzDqbc
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 09:30:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=BZTHasmM; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH8q00KhdzDqrn
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 09:27:55 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id l23so4918403edv.11
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 16:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZjEZanURaACmcw5iRrv/yEO8WNwL+ftH2XLJFhlx/7U=;
 b=BZTHasmMFhjMIar6GzJOvKE0oV9vF/X1BRlEPJivsySrmL2SvmqWsUF4gyw8oV5leH
 A2xeQrX79lgqMMKnlNJv7DzFsAY/tz9QRu9uNgCUPsMXtBPRYik3HHfMMfcWpb0LA5oM
 jiLpK3YNGJJ2jSEq0n2mtDMIYBU0JLAb5sALw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZjEZanURaACmcw5iRrv/yEO8WNwL+ftH2XLJFhlx/7U=;
 b=VYWYZbEepjF4MSOAlo62f+PPsQGzHt0FwQ17MWaxzPhl5OkrXUvOa94nZAcoFJbSo5
 JJx4VKdO0JLafWcfxY6poqTQYnfjqoBwpOp/BM2za7oqdsoepnxkE0q8pK7mFgZIaQaH
 iFvNdCE1GWYat/41EgjegtB840emPiX/TEAohzPr3M6QScfyTemieCB+AahHLtsjWjPo
 EBkpZ/K2VBrisi5LAeQiDYJdjdqUVDwx2L7BxolT1lJnoMy/b5DcIGzMtzN2Mw0oWz/K
 ik8BQT9UFKUmSV59Qoqbz1UYu1sgfwejAghcBSNPsEdTLEqR+uCoEqdiWr/vN72gBtGv
 bWxg==
X-Gm-Message-State: AOAM530pp/6FEb6lLyvboCPLrRu4ZYcxzEYZpjciMSnGCvAhZUOSutHL
 rndhoRt0GKZemTt/YYPO7cTg499vRSeygjxLDkw=
X-Google-Smtp-Source: ABdhPJwd+C5BT6si4cNvyC139X0BQKy/Y2vVUIPu3dUHH27QOr5uYWHHcJQx7kZVfqyQipBageZYy2MFYumOvNP3a7g=
X-Received: by 2002:aa7:c983:: with SMTP id c3mr109627edt.383.1596065272227;
 Wed, 29 Jul 2020 16:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200729204528.15157-1-eajames@linux.ibm.com>
 <20200729204528.15157-5-eajames@linux.ibm.com>
In-Reply-To: <20200729204528.15157-5-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Jul 2020 23:27:39 +0000
Message-ID: <CACPK8Xc5m7grNGSXniirnT1a6mg_iaT2YALkTSQTGdg9heNKTg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.7 4/6] dt-bindings: fsi: fsi2spi: Document new
 restricted property
To: Eddie James <eajames@linux.ibm.com>
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

On Wed, 29 Jul 2020 at 20:45, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add documentation for the "fsi2spi,restricted" property which indicates
> a controller shouldn't sequence loops and therefore has a smaller
> transfer size.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml b/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml
> index 893d81e54caa..ff16797061ec 100644
> --- a/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml
> +++ b/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml
> @@ -24,6 +24,16 @@ properties:
>      items:
>        - description: FSI slave address
>
> +patternProperties:
> +  "^spi(@.*|-[0-9a-f])*$":
> +    type: object
> +
> +    properties:
> +      fsi2spi,restricted:
> +        description: indicates the controller should not use looping in the
> +          sequencer and therefore has a smaller maximum transfer size
> +        type: boolean
> +
>  required:
>    - compatible
>    - reg
> --
> 2.24.0
>
