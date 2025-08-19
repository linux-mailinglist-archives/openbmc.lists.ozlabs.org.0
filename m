Return-Path: <openbmc+bounces-476-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF345B2BA10
	for <lists+openbmc@lfdr.de>; Tue, 19 Aug 2025 09:02:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5gWf0BcBz3cnK;
	Tue, 19 Aug 2025 17:02:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755586957;
	cv=none; b=OCDXWOyiBWDPYpu5uzle0mB5uL9k909/AnDvE+rSxo1WIbo08PN7F0WSdyhSK/bgQBX5MPl8DqTz9A6hJ5T+pXYzxLrHwFaJ3P6+/u6YIbtbKx3wpH7dOYjVtJmhK0BZ2KeFqqz51UBBlY/Fi99hPkfTp1gKsxbWySrzGqAtePfBvESt2QGyu67YVyt6DUo/30X+r0cNUFv/4WiK8kTWrvF33MQIJIU9u5qqOh8VvuNzoQbX7GKC+wHkLHJxCTkSk+tJn8NiUbyTtH0jWCWFCxRxqiizTFffyvM5uxitfz0TQPKopqEYSkBsoAh69unOa1mZHDGkiMrfQoTR1bu18A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755586957; c=relaxed/relaxed;
	bh=PXP8Alr4xZHZkSLHz8Lx/wtu/o2KmPHQlag8Ioi7tto=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Disposition; b=kDWzle1khvjz7ltmy5YWgrvK58s+pQEBUZXUm4gaFGlrjwtJ3uT3UYBawjBalZDwqDxZYDezIGARQThOMPbACJ0bSE3xSClzos3XyjxIAGVtB/Otg8nenhT3SvSnFcGxw7s4prlSfCTKtRaESVvSdCkTWsFF2efs5UoPMNq+ZbWbfu8qs+/+u3OM4+fIbYH2R+YCTKaVEhfBkhdcATt/n7NKusQjHAVhKYU2yvXlYzdgHTuVyRk6rvq9MoRVi3Z3QIqaOVxoBMZ4tBguJdJhr0g93xGUJBEgRRjXUi7cl7y0rGox/y6iXunbpxaiTUOAtTSR4IEoMAQaLreiyOyB2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lWSVqFvo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lWSVqFvo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5gWc5DHrz3cj7
	for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 17:02:35 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-32326e8005bso4981757a91.3
        for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 00:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755586952; x=1756191752; darn=lists.ozlabs.org;
        h=content-disposition:content-transfer-encoding:mime-version:subject
         :references:in-reply-to:message-id:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PXP8Alr4xZHZkSLHz8Lx/wtu/o2KmPHQlag8Ioi7tto=;
        b=lWSVqFvoBb8WbwPCMj+joehxu+B8FS5SpYpm0avT8owgyi7xnaalXdjsYjTuGIXxV+
         GtzxX8Fy63/+CMk0jaFODAqAwPImILShQ0cXW/3+B3GZ+aOG00EAY1hSPDqm/J6xHZP/
         Saf/c9ot3DAbu30pLxtPElSSSDZzLUlpQESP5e0jrjCeiES07nI5jBTh7BS72+TOksO6
         SLzyIHBrayRbtAEaVvk93+P4umCZXHaG9mtZFbSkJCLfKOJylDREwgybYKv7+873dNwO
         FCNm9nePUkHLHCsWe+lXgOwGNeetSlfdOP4OqWbtfSOkTX3v9wPb/BRAwCH8k/t8qdxB
         xeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755586952; x=1756191752;
        h=content-disposition:content-transfer-encoding:mime-version:subject
         :references:in-reply-to:message-id:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXP8Alr4xZHZkSLHz8Lx/wtu/o2KmPHQlag8Ioi7tto=;
        b=vC+cCkx5CdgWuOFKjUIHYcBuOiCSIfZl6aGx5K0cEEtvA26UVWHGJAII1+WRRfYYne
         RZ5ubfUg1dcoPE0W7ooXlU7rIplm8DuPUf2lAtonzbdMVhmDW0WMprXPJ3AHRfLVk4uw
         mcudMG5kR6tVep1mOZFhWr80Qohk4flez7vyyZATDsbhp7ckGL/eFla3ClDQMkd+9Of+
         pVyWx2RYQEH11Iab5GIcK7QgfyrdGuDTzzHECpMxsCY3ag2qrtfEGZwsv8OwivF2QBl7
         IQ3INu/gCz7sX9jejXWdyxbGiAnJ+ZJ1AFSXLSfVoI1S1nqWVCkc/BnZDkKb5jfFf4Gx
         jLgA==
X-Gm-Message-State: AOJu0YyhI7kmZ5uBBxgjLQqse7VUU1q83k5eEYWGIwwJjQGXHukQq1nE
	gDFwtoZ96Mod715RXJZz+iu0ogweQN5kBScyovxUg+no0oS/NWlFVx/LU4jIcAJw01Q=
X-Gm-Gg: ASbGncsZ3UtZVlnZy0ac4JzMYw/A13OzEyHGqtBlNMANzfgxX96RC9FY5a16yqS2aGa
	Z5nbkaTJMQ6hcY0vf5IeW1TaHQ1rLs6t7LeMLckYH5/yHgPf1y3v0Db/zhjz+oFDjg4NHwBakeV
	J8X644FlXuTAL1W8mdo6hwuqiJPHRE6Eb2KiZj4FkeS69Xl2BMn8a6QsSkfpQFaOQZWVveT2Cb+
	eujmjGUM/Oo8UrHvHcWN1TgatC6efeid4GutOdkEUm0G/hPpVHAC8xravCjy+e4a26rbAwj1OC7
	MibpMzxR1cE9NwS+ZijcVBtZMAMJvJEraAXU6xWd710Q7EBRdDoN1xtftscnmpgWqqn4Tx+KR/v
	8dbrYjlG5xG0qA7cQgIbeKeIjYNgBgLBdFnkwBQrEIc3KlUja
X-Google-Smtp-Source: AGHT+IGayutqfQN++IfsCFJLAlO2uwGuG8F2UsDAnMhvdaX7yloONJUMNuz8d7ARzNZ9tVkrLmbKLA==
X-Received: by 2002:a17:90b:58c7:b0:312:e279:9ccf with SMTP id 98e67ed59e1d1-3245e56113emr2182415a91.5.1755586951381;
        Tue, 19 Aug 2025 00:02:31 -0700 (PDT)
Received: from macbookpro.in.ibm.com ([129.41.58.3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7735f4sm9821894a12.48.2025.08.19.00.02.30
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Aug 2025 00:02:30 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:32:28 +0530
From: Manojkiran Eda <manojkiran.eda@gmail.com>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Message-ID: <4C478ABA-C44D-4B6D-BF7B-A4F2F76B3F7A@getmailspring.com>
In-Reply-To: <aKOKlY97pOtfuaEv@heinlein>
References: <aKOKlY97pOtfuaEv@heinlein>
Subject: Re: TOF elections for 2025H2
X-Mailer: Mailspring
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Aug 19 2025, at 1:48 am, Patrick Williams <patrick@stwcx.xyz> wrote:

> Hello,
> 
> It is time again for TOF elections.  The current roll-call is available
> at:
>    https://github.com/openbmc/tof-election/tree/main/2025H1
> 
> For this half, we have 3 seats up for election.  Currently those are
> held by Andrew Geissler, Ed Tanous, and Manojkiran Eda.  All 3 are
> eligible for re-nomination / re-election.
> 
> Nominations for those 3 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may nominate or be
> nominated.
> 
> Nominations are due by Sunday August 31, 2025.  The election, if
> required, will be held immeidately after with more details to follow.
> 
> As usual, disagreements with the rollcall results can be raised to the
> TOF.
> 
> -- 
> Patrick Williams
> 

I will re-nominate myself.

