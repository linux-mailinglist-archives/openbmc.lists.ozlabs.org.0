Return-Path: <openbmc+bounces-473-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4A8B2B253
	for <lists+openbmc@lfdr.de>; Mon, 18 Aug 2025 22:25:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5PNS0KB2z3chc;
	Tue, 19 Aug 2025 06:25:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755548728;
	cv=none; b=d6I9ScaFh+6s2XSaiEgPD8YyG97fS6jkUUKfTunydE7NxoLXTNpxU9ZfvldlUZTXWqckvoblpGLJ8ktk7PICHsSOAnaV/IOatZk49HL/6KqJ9h68MyqrDYw/rF/9I97ModAOK2wnXXeATtYt99DnXABTVbBEiQT82QqOQ9tUOnI5pfT+UpHodUG/Bf+nl4zwd7FnrM/GUCpXdY/DLHbn/eV0xLgcqq4PL6ZROmgyJYmG0+3EF15TW16pA/GgC7XyyWXI11sSZP4FbsaDN6Qan874OjpJJPrJeQYwCfZ9H4LJopLSHsvR7x3A2qD291JrNkN5iQeq20gwWeIq9eH0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755548728; c=relaxed/relaxed;
	bh=2j7ZDlFjne0Xl9vG/zGb0+sccRcPoh7WbHJYKekO9Nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8q1uvstgoxiKr15oP2ZEdFuaIQBIx4UDZf0boOObTbsk8npn/HCnwjjcoKE78q0BfMHgyv/4+EUiu0t4w9uEnIKsRyXgU/AaH7523Sv9LuBr34XGr4TQi93gfr/mdtL2FTVPMmktGxJran20V3t6dhaFSKvRQHp+hMaaKBUwiL4C1lzEZWFg2uW7SBzKR3+/lx6hozLUoNKKyH03I1Er32xdiuvls2vJySHkTHiTnR9K2bgZMglZ9K60NVKrFsOQmADcrNMgl+lDjgZdeq00HMo+sJ6Q8LhNlozEv8bzLfUTdo9pZKg9YU4lb16odcfCuLW8lInKmdueLppBfYWeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net; dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=d1MNhPlG; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org) smtp.mailfrom=tanous.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=d1MNhPlG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5PNQ3SN8z3cgl
	for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 06:25:25 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32326e202e0so3639906a91.2
        for <openbmc@lists.ozlabs.org>; Mon, 18 Aug 2025 13:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1755548723; x=1756153523; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2j7ZDlFjne0Xl9vG/zGb0+sccRcPoh7WbHJYKekO9Nw=;
        b=d1MNhPlGWyiQJ/wCdk3m0uQW/gtYIdA1heRYLHbQcn8N7T0+KYrbH6aZssd0YyX/Zn
         T2HfXc3lKVfPAf2s6ir+Jj6z9ypkTOQAlWasz3l9kbWIqDIpMu5DOZKkKy7JRYHYgnbq
         hIosKHh1AhIsQBIKLn2kro/8XST2oTBa+2U/qUy9EAGa+Vn2a69itPs0jSUpGRvHpHa/
         F4aiLbvZ1rSiFL2dbJpsXowFDwJA9CX+JJfKAfjO/Hf+JcO6TM8zPpncEi7AfopG/E9M
         s8L8vzwkuo6nmgyJc5JWpdRfimKhMDlCUJ5iPg4cjWTAkfWq8vRim56eni8vz5WeQpm5
         AUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755548723; x=1756153523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2j7ZDlFjne0Xl9vG/zGb0+sccRcPoh7WbHJYKekO9Nw=;
        b=smf3RCWkSXgJLBIPDVfiDawIn6cYsJZGteX7jqd8JCVcARc46AUEK0U6CpAMxo34ir
         syQFfxDEwy5ypM6/bc7n04fXsl/rerCHg2adDbWiLmtm5RN1YzWE+peA8nZVAz5wlaYA
         6tofDBXlkjWQI7ZUfxAOTC/oV6+DL1q95SL6/qQKuIF+Hq5SgNr2utrc1CHdOJZiismk
         806Zdj5z3Go2vI6bDE1cZOfXznwjBGVgC394XA+W9D73ESyALpyJnsJVdKcbP++baA2L
         gdd4ENxy+FojDpa4hzqOZX/RapbFOryEaU1Ka6ExWg9cpO5BkgtmoyarMYK1afgh5MNp
         XCnQ==
X-Gm-Message-State: AOJu0YySZXrWlZg8b6zcLb8LTXSKYIt+WMYqpWi8q9sxz39pw6dJqct0
	s1t8+MDF2uxPjdXLTw8lJ1adC1AmnpuqOxEx9FmKzrZl/S+jbovdu7ngVJQ92bI7fgtsCsLqb8V
	ieWa59kC+MznVqxdGhe2SzqMhL7Xi5dkP/aQU3a3HynhBxS7Gc1eC
X-Gm-Gg: ASbGncv+L7Y9sGkyl9S9jKlrKSJSZkdVMyM/2Wpnw/RQG0XGyprxrNRHmqkWv+ES1q9
	sEBbaeR+lgLM187//FieFcles12yiKIy6i/PovtrSJXXOJoClp346dGuwANPxtHSxQoAY6r+nsI
	NcGVPNVQi8Yeuc0GKD9iwFP3wzLIwJkYAJllkc8+vvCTyLzqeIwAy54E2QC/gMNheGMLBPrnOP4
	tZi708=
X-Google-Smtp-Source: AGHT+IFG5U005udigfdHiOi8lcIWzn9IPTe+JnrmHndUUDYF5U6zb2vQoGHuARHFMQGjhA1Sw7Akkvs1mZLS/BvcBz4=
X-Received: by 2002:a17:90b:50cf:b0:31f:7160:df4b with SMTP id
 98e67ed59e1d1-3245e58ff67mr345451a91.15.1755548722735; Mon, 18 Aug 2025
 13:25:22 -0700 (PDT)
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
References: <aKOKlY97pOtfuaEv@heinlein>
In-Reply-To: <aKOKlY97pOtfuaEv@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 18 Aug 2025 13:25:11 -0700
X-Gm-Features: Ac12FXxB312WxmV3h_NTVNJifwG2dSaufc7qbl-TSL_vOK06Z7gBlinCh2RfxWk
Message-ID: <CACWQX83TaC5BSxSBurhy6k+H0uAL9+Es5d7JtgNGyWZ4pi9WEQ@mail.gmail.com>
Subject: Re: TOF elections for 2025H2
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 18, 2025 at 1:18=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz=
> wrote:
>
> Hello,
>
> It is time again for TOF elections.  The current roll-call is available
> at:
>     https://github.com/openbmc/tof-election/tree/main/2025H1
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


I will re-nominate myself.

