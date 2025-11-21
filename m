Return-Path: <openbmc+bounces-931-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C352EC7AEAA
	for <lists+openbmc@lfdr.de>; Fri, 21 Nov 2025 17:45:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCh0W34jlz302l;
	Sat, 22 Nov 2025 03:45:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763743515;
	cv=none; b=FzfgavpU28yJQNlveE72TO0kDPWIIOSu4Ao4EJWJSwOgXnYuhlJ9KzFctpZnPrKtm5W2WgeJs9kTleH0j2N3vVNmp+xF8cGPKERxB3Wa+VvSi0KS2k2LGTROznTfsgaYOdOxKRkm5UHl/01E+JyWXHSNZonpUxEHi1BuXGijUPJqamxdFYLV+6DjSC36H3jCjeqdI3iXjVNK4A0nZDwfsQqOkfQ03GNVzfG3SY2RxjwepMiJzxO1OqFQNbHDSR6boZfHyPT4cx7WMj769J+h46XX1YPXQiz/gY50R5o4BHHzoiZwwBD1TsBc06V5RrHE+6XJ9+ds3f4RGehO/gwKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763743515; c=relaxed/relaxed;
	bh=uC+GwcPC0RBuBAGqEXM7j8Wqy2ZrY0iF1kAMJ/h5u9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FJzlmL5ULGVSN23ZEvjpJWfGsbjx0dnD+tM2gNC16zGYjP6PHkyMLPUl2ByGqUttYTzeYWUG7ntpwo+ZZsO0s5uz9KfzpAGAhnf6m0I7uZiBl+maNJJtAJI0voMNCffdeIiKuqgiAPG6gcZZMXn7rHqBHkBZruBdFiZJ0PS9nBWL+Z1OOFGXME20JIYYkWstAqlUe6W1AToZQEwsgu4xQhuqA268W9lf9L8+/Q//AxL4bB1KcUic8MMggegzMmfr45AJUY7FmMDb6ADtVTYJsCiWCHFgoQYa9/HgxkX+xsfgcWrkGEBstbdsfjncmO3ckZrQ8fhcGLzdA0zRtkpsXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QGd8KIoS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QGd8KIoS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCh0T4WgWz2yG5
	for <openbmc@lists.ozlabs.org>; Sat, 22 Nov 2025 03:45:13 +1100 (AEDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-5dbe6be1ac5so868715137.1
        for <openbmc@lists.ozlabs.org>; Fri, 21 Nov 2025 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763743510; x=1764348310; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uC+GwcPC0RBuBAGqEXM7j8Wqy2ZrY0iF1kAMJ/h5u9c=;
        b=QGd8KIoSLQQvwBP8hqjSM73wNEvm9Ctzgqll3RtF5lpcKdYVGQXrQj3dbQC0v1VehL
         H4bdV5zgI3nXvIBaaoDcUWURPRcTBG5hSgOSAD57xUB+WndRI/L7IzaTd6QhaSv7rzj7
         kS7iWOeuxboawfy7MYab8qB5dnV49NSmSLhBGz41lRNJ9H+lRzzXCYQEPnjvVWvOC7gF
         xhjDUU/4696Wj1kDi1YWvxgt4ifeHf4KjvzAU3DkZkSbuQUt/j2zPlEiYMzfNgnGUMsx
         B/1wdHljYRpAa2H23yFkFb6KncvS+wVPECNer9PTHRhQNz4J5kbJE5M9VDhD8p/gZnMV
         kiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743510; x=1764348310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uC+GwcPC0RBuBAGqEXM7j8Wqy2ZrY0iF1kAMJ/h5u9c=;
        b=I8gaJnB799aCHXYXS8axWuZztSsToyYE7gtfaRXITLmD/Yhi5bITZzVj+uXvyX1lNe
         j1S9EQFLDIuNrLgmQFHFdjuEUL/rhwTTf4L3cBzq0rxa92ffVq/0pw9GnUwQmDL95zJq
         IIFI26H04PyaOMkmt9Wt066Px2uLqo3lJUw2robS/1FWyb1vdmnT2uhtS4lxRH9AkLx8
         YS4ByYuJd14s2zHamUwUJK4MgEytvDwpRUSyp4igWfo5sfPbrxoQhMZKOnWPfdcsj2tK
         f0mUk/x/q42yY6VkNNnhURIWlE50hgWU+eQHCvcuq/vUTGJVUsX+rgAZii5PJk+iTT2d
         BvyA==
X-Gm-Message-State: AOJu0YzBXf8r4HtMC+qNrQMMSoOFpZm3/w8fdiyq38O3NSjRX6ADF/XC
	YM2Is6NMUeppBKQD8piMoLzPvIrLXOQu3sxMjrLeCD/Sm5KDas+/Pxh8zIQpvWnDHxV5aVqEuFi
	kscGShraRMxz08IzlqOeZzOZ+L05vGSY=
X-Gm-Gg: ASbGncvLjHXEjqsoRw3vQs6yU/c7hoepD8DZzTFVZWJGWO68Rh7grv+exV1irgaKe2c
	d2lFzC9CCA9+k/HP84L50zEiGeg60nKH2rQJQbqqbb5jiUNy4R1UhV28zzfEOhBmXClq2Jhxt/u
	kpuWici5yeiRlAFlSP4PmCET2nt7L+Wu6l81DRy11OsOp/ouj76o9zR3Q5UpFWm/bkER4Ij0dXV
	hRsfMyBqUbIN4iyQzCOxuyNwzcPCrYl6Gkocy+uDU9dPnGTNAHJNrnsobRMfKlI7qOkw/mgilfB
	qM4Qn9EeDOqe09t5TK6/PxnWGH2cvg1yc4non51e
X-Google-Smtp-Source: AGHT+IFI6hGINWKWUxGWYEY5DbiV/8eZu+ROP51sUlTclEsX79aKZUN4BgCkgFKQSIkx/coI/fvOzN9LZjAYsEBDC/s=
X-Received: by 2002:a05:6102:441b:b0:5db:f5d1:5786 with SMTP id
 ada2fe7eead31-5e1de2fe275mr893752137.23.1763743509626; Fri, 21 Nov 2025
 08:45:09 -0800 (PST)
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
References: <CYXPR12MB93185FD460BF55DC0279B0B796EEA@CYXPR12MB9318.namprd12.prod.outlook.com>
 <CYXPR12MB931837C7EBDACBD6666142C496D4A@CYXPR12MB9318.namprd12.prod.outlook.com>
In-Reply-To: <CYXPR12MB931837C7EBDACBD6666142C496D4A@CYXPR12MB9318.namprd12.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 21 Nov 2025 10:44:53 -0600
X-Gm-Features: AWmQ_bnlcJJXDMY4zgRR9XL94hIHiSEvDneVg_UuZHfwMnrqjutb3q1MF6GrBgE
Message-ID: <CALLMt=rm4ef0uMAZ4y+OKYAoxTpr6mGOKFLYBTxhUtBtt6Kq4Q@mail.gmail.com>
Subject: Re: updated Schedule A of CCLA from AMD
To: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>
Cc: openbmc <openbmc@lists.ozlabs.org>, "Ye, Iris" <Iris.Ye@amd.com>, 
	"Chiang, Bevis" <Bevis.Chiang@amd.com>, "Wang, Ryan" <Ryan.Wang3@amd.com>, 
	"Lu, Brian" <Brian.Lu@amd.com>, "Albert, Jason" <Jason.Albert@amd.com>, 
	"Lee, Ben (Engineering)" <KaiWei.Lee@amd.com>, "Ng, Ping Jie" <PingJie.Ng@amd.com>, 
	"Cheng, Albin" <Albin.Cheng@amd.com>, "Kumar, Ashok2" <Ashok2.Kumar@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 20, 2025 at 10:36=E2=80=AFAM Venkatesh, Supreeth
<Supreeth.Venkatesh@amd.com> wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
> Please find updated Schedule A of CCLA from AMD attached.
>
> Updated CCLA necessitated because of Schedule A change to add new members=
.

Thanks for keeping your CLA up to date. I've uploaded it to the
projects google drive.

