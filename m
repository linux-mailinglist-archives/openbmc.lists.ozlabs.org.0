Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD3D5F5D62
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 01:53:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjWcc69wbz3brF
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 10:53:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aM4GmOwE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aM4GmOwE;
	dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjWbw4lY3z2xKN;
	Thu,  6 Oct 2022 10:53:15 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id l27so170627qtv.4;
        Wed, 05 Oct 2022 16:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUpQg31qLSafDWUcMgUao3TMT+hDdWkhTyRDacQF7uQ=;
        b=aM4GmOwECMjw5l+6WPAkjD95HWW14o1oUdCNLymwXqDtwYnovROQVfse+/38It/BnU
         bz6JXDMVSPU9QCZgwYQgcZsFFwnMunvi41/w24Vlyvjw9SRyFkfd0b+YF4Jupx/w1XJQ
         5LoVH/pyiY3gnxBzZbsU5Zi8J55p7svv7P8f2rfYQpBpQzQwNOVa92u6d6U0yi1/NhjH
         SPc8QzmVX8yfb/U3KAVJcgpp/Z2AmvFuQeGnkYk2/xGpfy+9EyyD8s8HkPJ2uSf6RLwY
         y5ddeigsWn/6VaZsQdFBT9/RFRvv0zV9Njgqxi8xEwwl1/MV/WrrskuGmBsf56xNnCkV
         hScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fUpQg31qLSafDWUcMgUao3TMT+hDdWkhTyRDacQF7uQ=;
        b=ErSD/2NawNLzeH6iu64ZaGivcRbUfowoTlUKk9hrI4xt22TR42DHQKEuD6dgge7pXw
         eS6p1b3QG+6Hh6b0Sbm3zzN65vKIfahY2x01QYapD8yGLzVC5Q8VO618p0Y5Zc3yUhVj
         TcyuxH6hYzq0e9iNqaWKS/a3ty0Thr5DN/kBR8EPpUNTIYADlKP46NdRcLzCGQc8hQko
         BiNsNGJKAE3SQQ5fJ4xoUQ8cBirq1bP7gPkuj0ITtSF9FkOIbOI76HgclWkc9naDbFtD
         caD3tVEz/4npPXpIGqHq1+CsY85ErVxTwHrbLOkQYHx9LAgo3uEH4thH7JPkmgOgLygq
         aA5g==
X-Gm-Message-State: ACrzQf0l/nDmHpfbh3R8QCJ1pNSSgJB92OV28ZHgifg1m4HLWDDsDIHj
	tvOVESxpxRx5j/DUi2ifvA==
X-Google-Smtp-Source: AMsMyM7m3ZznC2N6vijBuwEzRYV9NyM1wkH4hn9XNVHWQUQZQGyIYol4VV1OoYMqoKHVzo1kf7YGHQ==
X-Received: by 2002:a05:622a:1109:b0:35b:ae57:5a6c with SMTP id e9-20020a05622a110900b0035bae575a6cmr1572054qty.23.1665013991706;
        Wed, 05 Oct 2022 16:53:11 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.126])
        by smtp.gmail.com with ESMTPSA id y17-20020ac83e91000000b0038d9555b580sm3526480qtf.44.2022.10.05.16.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 16:53:11 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:2d13:71e3:7ea0:219])
	by serve.minyard.net (Postfix) with ESMTPSA id 61E83180015;
	Wed,  5 Oct 2022 23:53:10 +0000 (UTC)
Date: Wed, 5 Oct 2022 18:53:06 -0500
From: Corey Minyard <minyard@acm.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v10 0/3] Add SSIF BMC driver
Message-ID: <Yz4Y4piC+e1mftLi@minyard.net>
References: <20221004093106.1653317-1-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004093106.1653317-1-quan@os.amperecomputing.com>
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
Reply-To: minyard@acm.org
Cc: devicetree@vger.kernel.org, thang@os.amperecomputing.com, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 04, 2022 at 04:31:03PM +0700, Quan Nguyen wrote:
> This series add support the SSIF BMC driver which is to perform in-band
> IPMI communication with their host in management (BMC) side.
> 
> SSIF BMC driver in this series is tested with Aspeed AST2500 and AST2600

I have applied the two IPMI patches to the IPMI tree for 6.2.  Thanks
for sticking with this.

-corey

> 
> Discussion for v9:
> https://lore.kernel.org/lkml/20220929080326.752907-1-quan@os.amperecomputing.com/
> 
> v10:
>   + Issuing RxCmdLast command for all errnos                   [Wolfram]
> 
> v9:
>   + Fix dependence with I2C subsystem                            [Randy]
>   + Update missing Reviewed-by tag from v7                         [Rob]
>   + Remove useless error handling path                              [CJ]
>   + Update comment for SSIF_ABORTING state                          [CJ]
>   + Fix "unknown type name --u8"                     [kernel test robot]
>   + Update commit message and add comment to explain
>     the effect of issuing RxCmdLast when Slave busy               [Quan]
> 
> v8:
>   + Dropped ssif_bmc.h file and move its content to ssif_bmc.c   [Corey]
>   + Add struct ipmi_ssif_msg to include/uapi/linux/ipmi_ssif_bmc.h
>   header file                                                    [Corey]
>   + Use unsigned int for len field in struct ipmi_ssif_msg       [Corey]
>   + Avoid using packed structure                                 [Corey]
>   + Add comment to clarify the logic flow                        [Corey]
>   + Fix multipart read end with len=0 issue                      [Corey]
>   + Refactor code handle the too big request message             [Corey]
>   + Fix code indentation issue                                   [Corey]
>   + Clean buffer before receiving request to avoid garbage        [Quan]
>   + Fix the license to SPDX-License-Identifier: GPL-2.0-only      [Quan]
> 
> v7:
>   + Remove unnecessary del_timer() in response_timeout()         [Corey]
>   + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]
>   + Dropped the use of ssif_msg_len() macro, use the len directly [Quan]
>   + Solve possible issue if both response timer and ssif_bmc_write()
>   occurred at the same time                                      [Corey]
>   + Fix wrong return type of ssif_bmc_poll()         [kernel robot test]
>   + Refactor and introduce ssif_part_buffer struct to replace the
>   response_buf to manage each send/receive part of ssif           [Quan]
>   + Change SSIF_BAD_SMBUS state to SSIF_ABORTING state           [Corey]
>   + Support abort feature to skip the current bad request/response and
>   wait until next new request                                    [Corey]
>   + Refactor the PEC calculation to avoid the re-calculate the PEC on
>   each I2C_SLAVE_WRITE_RECEIVED event                             [Quan]
>   + Fix the use of error-proned idx                              [Corey]
>   + Defer the test for valid SMBus command until the read/write part
>   is determined                                                   [Quan]
>   + Change/split unsupported_smbus_cmd() to
>   supported_[write|read]_cmd()                                   [Corey]
>   + Abort the request if somehow its size exceeded 255 bytes      [Quan]
> 
> v6:
>   + Drop the use of slave_enable()                             [Wolfram]
>   + Make i2c-aspeed to issue RxCmdLast command on all
>   I2C_SLAVE_WRITE_REQUESTED event to assert NAK when slave busy   [Quan]
>   + Make i2c slave to return -EBUSY when it's busy                [Quan]
>   + Drop the aborting feature as return Completion Code 0xFF may stop
>   host to retry and make ipmi_ssif.so fails to load               [Quan]
>   + Add timer to recover slave from busy state when no response   [Quan]
>   + Clean request/response buffer appropriately                   [Quan]
>   + Add some minor change on error and warning messages           [Quan]
> 
> v5:
>   + Correct the patches order to fix the bisect issue found by
>   kernel build robot
> 
> v4:
>   + Fix recursive spinlock                                      [Graeme]
>   + Send response with Completion code 0xFF when aborting         [Quan]
>   + Fix warning with dt_binding_check                              [Rob]
>   + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml                  [Quan]
>   + Added bounding check on SMBus writes and the whole request     [Dan]
>   + Moved buffer to end of struct ssif_bmc_ctx to avoid context
>     corruption if somehow buffer is written past the end           [Dan]
>   + Return -EINVAL if userspace buffer too small, don't
>     silence truncate                                       [Corey, Joel]
>   + Not necessary to check NONBLOCK in lock                      [Corey]
>   + Enforce one user at a time                                    [Joel]
>   + Reject write with invalid response length from userspace     [Corey]
>   + Add state machines for better ssif bmc state handling         [Quan]
>   + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
>     SSIF BMC driver                                               [Quan]
>   + Change compatible string "aspeed,ast2500-ssif-bmc" to
>     "ampere,ssif-bmc"                                             [Quan]
>   + Toggle Slave enable in i2c-aspeed to turn on/off slave mode   [Ryan]
>   + Added slave_enable() to struct i2c_algorithm to control
>     slave mode and to address the recursive spinlock      [Graeme, Ryan]
>   + Abort current request with invalid SMBus write or
>     invalid command                                               [Quan]
>   + Abort all request if there is pending response                [Quan]
>   + Changed validate_pec() to validate_request()                  [Quan]
>   + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
>   + Print internal state string for ease investigating issue      [Quan]
>   + Move to READY state on SLAVE_STOP event                       [Quan]
>   + Change initilize_transfer() to process_smbus_cmd()            [Quan]
>   + Introduce functions for each slave event                      [Quan]
> 
> v3:
>   + Switched binding doc to use DT schema format                   [Rob]
>   + Splited into generic ssif_bmc and aspeed-specific      [Corey, Joel]
>   + Removed redundant license info                                [Joel]
>   + Switched to use traditional if-else                           [Joel]
>   + Removed unused ssif_bmc_ioctl()                               [Joel]
>   + Made handle_request()/complete_response() to return void      [Joel]
>   + Refactored send_ssif_bmc_response() and
>   receive_ssif_bmc_request()                                     [Corey]
>   + Remove mutex                                                 [Corey]
>   + Use spin_lock/unlock_irqsave/restore in callback             [Corey]
>   + Removed the unnecessary memset                               [Corey]
>   + Switch to use dev_err()                                      [Corey]
>   + Combine mask/unmask two interrupts together                  [Corey]
>   + Fixed unhandled Tx done with NAK                              [Quan]
>   + Late ack'ed Tx done w/wo Ack irq                              [Quan]
>   + Use aspeed-specific exported aspeed_set_slave_busy() when
>   slave busy to fix the deadlock                 [Graeme, Philipp, Quan]
>   + Clean buffer for last multipart read                          [Quan]
>   + Handle unknown incoming command                               [Quan]
> 
> v2:
>   + Fixed compiling error with COMPILE_TEST for arc
> 
> Quan Nguyen (3):
>   ipmi: ssif_bmc: Add SSIF BMC driver
>   bindings: ipmi: Add binding for SSIF BMC driver
>   i2c: aspeed: Assert NAK when slave is busy
> 
>  .../devicetree/bindings/ipmi/ssif-bmc.yaml    |  38 +
>  drivers/char/ipmi/Kconfig                     |  10 +
>  drivers/char/ipmi/Makefile                    |   1 +
>  drivers/char/ipmi/ssif_bmc.c                  | 873 ++++++++++++++++++
>  drivers/i2c/busses/i2c-aspeed.c               |   9 +-
>  include/uapi/linux/ipmi_ssif_bmc.h            |  18 +
>  6 files changed, 948 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
>  create mode 100644 drivers/char/ipmi/ssif_bmc.c
>  create mode 100644 include/uapi/linux/ipmi_ssif_bmc.h
> 
> -- 
> 2.35.1
> 
