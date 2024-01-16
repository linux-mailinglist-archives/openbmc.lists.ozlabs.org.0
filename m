Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0B482F160
	for <lists+openbmc@lfdr.de>; Tue, 16 Jan 2024 16:22:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dAkfmmSg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDt6d4pQXz3bnt
	for <lists+openbmc@lfdr.de>; Wed, 17 Jan 2024 02:22:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dAkfmmSg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDt614zQ9z2yGv
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2024 02:22:00 +1100 (AEDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5e89ba9810aso81681477b3.2
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2024 07:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705418517; x=1706023317; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=13JrJeAldiqSPGnO/8nR55kEZJiWwYEFrmzzkOgGtcQ=;
        b=dAkfmmSgga7BQ9VEdx7Z2ZegyZPTw97JWfgqiRZYMbSC1mLxgCQ41Qb2yGoi5h7KRW
         mUsh4yKwU6z+xXFaQ3BhTanw5BBiPDnm2BPg+GNsCPtwYeVF0RejYcJZCr/9s/4pcP0z
         3v2Zg4hGna+B6DzL2ebzAnTDBFiHLqbhJWaHZhTbQw1iLJ1glnY/lzsLCuYWeBhumFYN
         UiZUlDZYxtJqgCAiYkYH3zJ592GJtPx+FlbCY+rkDYIsTr8YYEmDHM5SdayrJX2tQHiv
         cSRBlqNHJCifP7XSSH1pMlF1wzWEbV0nF505CguPMRJE/B7XEJW7aBKmV0fK9nkFcXmI
         ZeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705418517; x=1706023317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13JrJeAldiqSPGnO/8nR55kEZJiWwYEFrmzzkOgGtcQ=;
        b=r/FjWvbecQzbI5C16RJB7bur/tfS17Rgl4F5NwbKNQBj8zFCCBsNUJpFXtIHEwjcD5
         ac+Y69rSH6brPweREbzbUJBHh7yINl8Wql6NZvu61ZFSt+N4hRbj83wH1+vclwqYqC/v
         j8XtGFdyevmbVawg5jIja61yOuIMjfZWRHuh2C1SBxwSySGyQ1SwjitrNlipOGlzMhaF
         NBXrODkXYCiLK0q82STkCN+WGHdEpWN2foX8OgsInoWSwr4UcHw639XN0d6meuyAxWtc
         ssoPvGsuCWrVzw4SfVGPY+OGuf6hf+nZNf7YKMkafjbz2neyhdOpxPr2FfoIuZGpL9we
         JGMw==
X-Gm-Message-State: AOJu0YxS3nHKiXq6GD7bS9egzSrzJMvTvwPjQwU85HIF1NCFaUOynG4P
	aJIL2edMf7ppWNiEA8QcP7E9Nl+KR7JLHvhtapM=
X-Google-Smtp-Source: AGHT+IFlQeu3q+ElU+rld3EnjOvz9eE/88otShb9zYT15iLTCLTu+OZ9uWUpKmfFbrAENM1p3a2FZ3JgKivbohmlLEI=
X-Received: by 2002:a81:8584:0:b0:5fb:9705:5853 with SMTP id
 v126-20020a818584000000b005fb97055853mr5307731ywf.73.1705418517573; Tue, 16
 Jan 2024 07:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20240108135421.684263-1-tmaimon77@gmail.com> <20240108135421.684263-2-tmaimon77@gmail.com>
 <20240109170830.GA2772086-robh@kernel.org> <CAP6Zq1jCHVrFfRa6c3DZ4t2aaJTkWukeEkia0AqhzppC0mjbfg@mail.gmail.com>
 <dc739435-d955-44f7-b5ee-9de4d5336725@linaro.org> <78875535469138a0fd0659d7e621a4f2.sboyd@kernel.org>
In-Reply-To: <78875535469138a0fd0659d7e621a4f2.sboyd@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jan 2024 17:21:46 +0200
Message-ID: <CAP6Zq1gcjayNA0j2fR-RW_mSJN41RS4PR2Q9AjLKFoGOvo-ecQ@mail.gmail.com>
Subject: Re: [PATCH v22 1/8] dt-bindings: clock: npcm845: Add reference 25m
 clock property
To: Stephen Boyd <sboyd@kernel.org>
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
Cc: Rob Herring <robh@kernel.org>, benjaminfair@google.com, devicetree@vger.kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Stephen,

On Wed, 10 Jan 2024 at 23:46, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Krzysztof Kozlowski (2024-01-10 12:54:14)
> > On 10/01/2024 14:47, Tomer Maimon wrote:
> > >>> +
> > >>> +  clock-names:
> > >>> +    items:
> > >>> +      - const: refclk
> > >>> +
> > >>>    '#clock-cells':
> > >>>      const: 1
> > >>>      description:
> > >>> @@ -30,12 +38,20 @@ properties:
> > >>>  required:
> > >>>    - compatible
> > >>>    - reg
> > >>> +  - clocks
> > >>> +  - clock-names
> > >>
> > >> New required properties are an ABI break. That's fine if you explain why
> > >> that's okay in the commit msg.
> > > What do you mean?
> >
> > I think it was clear. Which part is not clear?
> >
> > > Could I add the new required properties to the required list?
> >
> > You just did, didn't you? And received feedback that you are breaking
> > the ABI.
> >
>
> It's fine to break the ABI as long as the commit message explains that
> the driver isn't merged yet.

Thanks for your clarification.

Best regards,

Tomer
