Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CA13EE0F9
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 02:34:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpX8k5XtNz30RV
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 10:34:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FH1hPc91;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2f;
 helo=mail-yb1-xb2f.google.com; envelope-from=newb2.d.c.2013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FH1hPc91; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp4Sd6rHkz2yNx
 for <openbmc@lists.ozlabs.org>; Mon, 16 Aug 2021 16:46:25 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id z5so30914716ybj.2
 for <openbmc@lists.ozlabs.org>; Sun, 15 Aug 2021 23:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Su41F6TrclJiiOEFWHNbetKdVN6Hx66kc0g+Ikk5Im4=;
 b=FH1hPc91q5ECPKUc42wZgAl3ATbpqALUrGqGi+dI74UgyvrNsc1QrO5M4vFLr6I0hh
 aQmGOAKY7l7j8wvL8MYnfaV8Z98AaR1XnGrc8We7/ZOdJ763hAIcN1Ht+cjwIKIQStOX
 QCgFLSpXU1v+dQgxEYjhb6RzRl9ddcvel8E1h6uXQ1MX9EiV2Uauy0UeJl+nafIAz34W
 GUv1YpD1ACScvVCPzqValkh6FJNGeFOy8OkBhYAXejfe9O/qL4PIYbnreqR86F7Rn98X
 uIsK9BNzKuFdPW0WjZPuYSssHFjHTJ8JxbqzxIk3nudfwM51EQkZEtsadU7O4MOnVcyz
 Ld6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Su41F6TrclJiiOEFWHNbetKdVN6Hx66kc0g+Ikk5Im4=;
 b=b0Kbg/2U55n2Bd+HylRh5/bUhS4n4YNWklfDaT6DftiLlfueR+WLCB3fr6lh36YBt+
 KUpgx8ys/9z7fd4ZkBW1SjSXbG+SJr3FqK24DfOwvwtC9N3CHf9exDg8UO3NAxi+MQqF
 Cdg6ISUOhj0/jAK0T5WidqU6lLajHgsuu8MmY2S50H22hIz9eNYZx+oVw9HnjLyZJbhE
 lvVHF9pfYm/fc6GPp1LLY5Jj6sjcCok3eZ9YxnsuHiT7EC8idBnn8Cx3Z0JWfaZmTy5l
 k6B8tOJpOlnnSJ/R9mFZqJo8DBpHmPPFylRGRN9SbUTcb38Yv5/ICuczZqf0VhuVu2zt
 PGSg==
X-Gm-Message-State: AOAM5326Z8cohGWJ18o7HfT2gdQJJVPvX3DnrZe+8OMPABdyUF3OFzLr
 gOCIa33WtuqRD+MRH+wkTCxBXmet2BC41RgtcnZxTxhOzL6Row==
X-Google-Smtp-Source: ABdhPJxrTcFutLTiY4t1IBuacMqgT/C9vEx2RdUKAmGK4w5L+jPBZJHM/Q/0G1epucTGWtVh4ffv7ANxyNW+PXjMizk=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr19077256ybg.167.1629096380207; 
 Sun, 15 Aug 2021 23:46:20 -0700 (PDT)
MIME-Version: 1.0
From: Figo Chen <newb2.d.c.2013@gmail.com>
Date: Mon, 16 Aug 2021 14:46:09 +0800
Message-ID: <CAK2KAUCFQSHq9zu3JaJ6gG_VYTywUJXydWPcuZ0nHuEDtdQJDw@mail.gmail.com>
Subject: Apply the account for OpenBMC contribute
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000000c161305c9a78f59"
X-Mailman-Approved-At: Tue, 17 Aug 2021 10:32:43 +1000
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000c161305c9a78f59
Content-Type: text/plain; charset="UTF-8"

Dear Sir,

May I have an account to join the OpenBMC git to contribute ?

Thanks,
Newb.d.c

--0000000000000c161305c9a78f59
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Dear Sir,<div><br></div><div>May I have an account to join the OpenBMC git to contribute ?</div><div><br></div><div>Thanks,</div><div>Newb.d.c</div></div>

--0000000000000c161305c9a78f59--
