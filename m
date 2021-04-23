Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E59368E34
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 09:59:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRRX11Lbqz301p
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 17:59:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=o6veisea;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=o6veisea; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRRWm6fX4z2xZy
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 17:59:14 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id s4so7991030qtw.3
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 00:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Qv/Fqw5zQhVbviGRmtlm4s2n/rKlQZrKMMKdT3onTq0=;
 b=o6veiseaT6BK4nrxAMR9Uv3ffpZTGBPcdrgc2u7mP4iDaqvnPc7/17ffVTyZ+gaRFV
 CJfyW/zWCcJmYO6G2ZR90TOIFDFjrdCD9J0ZV2vmoZooDKBhmy3H31ls3BtdQ7PJ79e7
 4zUy+fR4Q3FjiQtKnklCDdQfurDPQTKvBiBPlOpZ7cC1UjPdy7fXyZAKtOZAgoRHS6EA
 jyXzA+L44fcVytL9qTKCIq7vYoAVVFG7XCA3hGFaIjFIuW55/fxL1KX/0I32KOqLiDRn
 MYF7hPule3jVznvEMo+xttnREUp788S5aHUOql9xz5TEtpxjhJp/dfMgJQNCDa8/+DPN
 pEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Qv/Fqw5zQhVbviGRmtlm4s2n/rKlQZrKMMKdT3onTq0=;
 b=FYsAyBrUo45yytH3z1HVS1p/oCKEbq/Wyyq+73TRXABF+pS7eSQdYml4Lx/XnzTK7q
 Fc4lLxpQXLNZoJe1lgAQ5SY3pesluisC+TZEu6J1y1HJfwCCW0EmrZgmcjfa7r8Z10wU
 0llS59lwKxTPlLx/rZ/I3+y1lJXzinKKWQC06A+yN2QL9R7phYLop5+Ish6NLVoOGRPC
 TqJGz5Vx1zFH+rz3MZfxwWzO9algEb/nzFaintJKFUi7OIQier8wDlX2JL7G3OqygIqT
 fk3mV3WI9Ed9z+v7W+q1KRX35/KfQ0q1E7IN6vBcGn1Y5Ax3jhSmzzE/4Au0MNy1fxeL
 4Dfw==
X-Gm-Message-State: AOAM530DqVYgfN5tvepS03Ipr5ao0WCFOgbk94mpaeGbuSdkN09Hh5kv
 h8kh/TJQFkFWLqCOtYF9hVJkmxt3aLea8CeR1+TqFOU41Ot/lA==
X-Google-Smtp-Source: ABdhPJyxjXwbwTGXbNVo//X1eYD1s65vh94VPBPYzaM+h7gvqv9MS+jFnBgtBpgzZTOKWBeRNW5mrwc9gmO4J1DeGvg=
X-Received: by 2002:aed:2042:: with SMTP id 60mr2544042qta.340.1619164750692; 
 Fri, 23 Apr 2021 00:59:10 -0700 (PDT)
MIME-Version: 1.0
From: George Liu <liuxiwei1013@gmail.com>
Date: Fri, 23 Apr 2021 15:58:59 +0800
Message-ID: <CANFuQ7DizmmqHEU-iTe56pt9mfi+MYaNjNCoXsgSpxYQ92Acyg@mail.gmail.com>
Subject: How to analyze core dump data
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hey guys:
I have a question:

When I test and monitor the `bmcweb` daemon, sometimes I encountered a
`core dump` due to the code error. I want to extract the core dump
data and analyze it to quickly locate the number of lines of code, but
I do not know how to analyze core dump data.

I tried to use `gdb` to operate(gdb <binary file> <coredumpfile>), but
I did not get the desired result. So I want to know if there are other
ways to analyze core dump data? Or where there are references, please
let me know, Thank you.

George Liu
