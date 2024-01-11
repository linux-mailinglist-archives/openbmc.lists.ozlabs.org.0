Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE2282B833
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 00:46:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R4i/pFtX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TB1Wr1wPDz3cXy
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 10:46:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R4i/pFtX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243; helo=mail-oi1-x243.google.com; envelope-from=giridharikrshna@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9Xc218H5z30Jy
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2024 16:02:57 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id 5614622812f47-3bc09844f29so4080749b6e.0
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2024 21:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704949371; x=1705554171; darn=lists.ozlabs.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=R4i/pFtX4l+i6Kpnc1YltO3LU3wDTubIUbixW/2uKfnbsh56RVJKJA7MseqaJa7b44
         Q3af1GkqhY8B2+/zUvq1Px3lx1hkx69tnUUo7wMAANQOTfz7Z/hCWoT1MHzaz8udJ9pj
         HJOKDKDRRSjwhs3sZ+cDGLTJPA1G8UN14SWUaoKL26EDU10zt6WXoYomvIwzZxFVdcu1
         xMfDe9nd9RIMJvuZfb4LuoCmXDwOao5TVsHJdA9KLKxddu+TyeBqjTh7t6l06fh2P/gB
         NK5Rn6Btfl3TcBcGVaWkBLZwkKi6Rkw1tul/vMx8XYpu7EW9v9FEPyQ9WW9O5xLFs3BL
         C+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704949371; x=1705554171;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=XH4qoIAoGhNOnfB4bE/iSwyvuQuh9WOAJThMbo3FmIoHOXF9/a1lnDdfUg05rpg2jV
         KLmFQKUCQYqhkf6lF8kAlvPTvhNEIR+bJNAc7q2giqsx6D2p1sklR7XlTOHwXhZkN2Yt
         +8Nq3z/LmhVaZ2C+Wdg7UpNQWXXx158CnEHKb0RLvT52dJZYUgcsbcJcVcJxOR9g/nVb
         5anI7cmHH96s4ZJuETV/d5TldZbkjftYQ3AY4NqOP0VbpBQjYCfC74NWnrG4ptWBV+xA
         ZOX+qffZsd1RaL51WIUNtekUKMaju/5YSSIch1baopTyUuDCqREamXRPBd7td4cLBtS4
         2MeA==
X-Gm-Message-State: AOJu0YzmC+gt12Q5jqvVNzwd78S4901Mrocza0KYyMzwp9OCyzXFCiW2
	MSUt0GL4AkM5h2xxaAYtrYa0NbUBxH9fAdib15o=
X-Google-Smtp-Source: AGHT+IH7ieB7Gyslci5mIL1XnAtpaFRlit5Mwug6lPceyVflisXVRlI4//uvBXtCqaDq2e+ZMgmK3A==
X-Received: by 2002:a05:6808:23c6:b0:3bd:3b39:c400 with SMTP id bq6-20020a05680823c600b003bd3b39c400mr871395oib.48.1704949371504;
        Wed, 10 Jan 2024 21:02:51 -0800 (PST)
Received: from smtpclient.apple ([103.21.232.121])
        by smtp.gmail.com with ESMTPSA id s5-20020a056a00178500b006d96ad39308sm197218pfg.165.2024.01.10.21.02.49
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jan 2024 21:02:50 -0800 (PST)
From: G Krishna <giridharikrshna@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: arm: dts: Aspeed: Bonnell: Separate LEDs into include file
Message-Id: <52F6CCE4-2C34-4E1F-838E-CACFC0A4A6ED@gmail.com>
Date: Thu, 11 Jan 2024 10:32:36 +0530
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-Mailman-Approved-At: Fri, 12 Jan 2024 10:42:46 +1100
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

