Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8896B8699C
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 21:09:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464HxK3zPNzDqrZ
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 05:09:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464HwG3QGBzDqhT
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 05:08:45 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 12:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,362,1559545200"; d="scan'208";a="186446654"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga002.jf.intel.com with ESMTP; 08 Aug 2019 12:08:42 -0700
Subject: Re: [RFC v3 dev-5.2 4/5] i2c: aspeed: add buffer mode transfer support
To: Eddie James <eajames@linux.vnet.ibm.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Cedric Le Goater <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tao Ren <taoren@fb.com>
References: <20190718193520.17058-1-jae.hyun.yoo@linux.intel.com>
 <20190718193520.17058-5-jae.hyun.yoo@linux.intel.com>
 <99174ff8-7363-29d3-7919-061bb949a276@linux.vnet.ibm.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <673e2594-cb3b-e34c-4a2a-7a5c98ee54c1@linux.intel.com>
Date: Thu, 8 Aug 2019 12:08:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <99174ff8-7363-29d3-7919-061bb949a276@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Eddie,

On 8/8/2019 11:14 AM, Eddie James wrote:
> 
> On 7/18/19 2:35 PM, Jae Hyun Yoo wrote:
>> Byte mode currently this driver uses makes lots of interrupt call
>> which isn't good for performance and it makes the driver very
>> timing sensitive. To improve performance of the driver, this commit
>> adds buffer mode transfer support which uses I2C SRAM buffer
>> instead of using a single byte buffer.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Tested-by: Tao Ren <taoren@fb.com>
>> ---
>> v2 -> v3:
>>   - Fixed resource getting logic using indices instead of reg-names to 
>> make
>>     this driver compatible with old device trees.
>>   - Refined slave RX flow to get rid of duplicate read on the first 
>> byte of
>>     received data.
>>
>> v1 -> v2:
>>   - Moved I2C SRAM enabling code from irq-aspeed-i2c-ic module to this 
>> module.
>>
>>   drivers/i2c/busses/i2c-aspeed.c | 294 ++++++++++++++++++++++++++++----
>>   1 file changed, 260 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c 
>> b/drivers/i2c/busses/i2c-aspeed.c
>> index 40f6cf98d32e..b314101aaa9e 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -7,6 +7,7 @@
>>    *  Copyright 2017 Google, Inc.
>>    */
>> +#include <linux/bitfield.h>
>>   #include <linux/clk.h>
>>   #include <linux/completion.h>
>>   #include <linux/err.h>
>> @@ -19,15 +20,24 @@
>>   #include <linux/irqchip/chained_irq.h>
>>   #include <linux/irqdomain.h>
>>   #include <linux/kernel.h>
>> +#include <linux/mfd/syscon.h>
>>   #include <linux/module.h>
>>   #include <linux/of_address.h>
>>   #include <linux/of_irq.h>
>>   #include <linux/of_platform.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>>   #include <linux/reset.h>
>>   #include <linux/slab.h>
>> -/* I2C Register */
>> +/* I2C Global Registers */
>> +/* 0x00 : I2CG Interrupt Status Register  */
>> +/* 0x08 : I2CG Interrupt Target Assignment  */
>> +/* 0x0c : I2CG Global Control Register (AST2500)  */
>> +#define ASPEED_I2CG_GLOBAL_CTRL_REG            0x0c
>> +#define  ASPEED_I2CG_SRAM_BUFFER_EN            BIT(0)
>> +
>> +/* I2C Bus Registers */
>>   #define ASPEED_I2C_FUN_CTRL_REG                0x00
>>   #define ASPEED_I2C_AC_TIMING_REG1            0x04
>>   #define ASPEED_I2C_AC_TIMING_REG2            0x08
>> @@ -35,14 +45,12 @@
>>   #define ASPEED_I2C_INTR_STS_REG                0x10
>>   #define ASPEED_I2C_CMD_REG                0x14
>>   #define ASPEED_I2C_DEV_ADDR_REG                0x18
>> +#define ASPEED_I2C_BUF_CTRL_REG                0x1c
>>   #define ASPEED_I2C_BYTE_BUF_REG                0x20
>> -/* Global Register Definition */
>> -/* 0x00 : I2C Interrupt Status Register  */
>> -/* 0x08 : I2C Interrupt Target Assignment  */
>> -
>>   /* Device Register Definition */
>>   /* 0x00 : I2CD Function Control Register  */
>> +#define ASPEED_I2CD_BUFFER_PAGE_SEL_MASK        GENMASK(22, 20)
>>   #define ASPEED_I2CD_MULTI_MASTER_DIS            BIT(15)
>>   #define ASPEED_I2CD_SDA_DRIVE_1T_EN            BIT(8)
>>   #define ASPEED_I2CD_M_SDA_DRIVE_1T_EN            BIT(7)
>> @@ -102,6 +110,8 @@
>>   #define ASPEED_I2CD_BUS_RECOVER_CMD            BIT(11)
>>   /* Command Bit */
>> +#define ASPEED_I2CD_RX_BUFF_ENABLE            BIT(7)
>> +#define ASPEED_I2CD_TX_BUFF_ENABLE            BIT(6)
>>   #define ASPEED_I2CD_M_STOP_CMD                BIT(5)
>>   #define ASPEED_I2CD_M_S_RX_CMD_LAST            BIT(4)
>>   #define ASPEED_I2CD_M_RX_CMD                BIT(3)
>> @@ -112,6 +122,13 @@
>>   /* 0x18 : I2CD Slave Device Address Register   */
>>   #define ASPEED_I2CD_DEV_ADDR_MASK            GENMASK(6, 0)
>> +/* 0x1c : I2CD Buffer Control Register */
>> +/* Use 8-bits or 6-bits wide bit fileds to support both AST2400 and 
>> AST2500 */
>> +#define ASPEED_I2CD_BUF_RX_COUNT_MASK            GENMASK(31, 24)
>> +#define ASPEED_I2CD_BUF_RX_SIZE_MASK            GENMASK(23, 16)
>> +#define ASPEED_I2CD_BUF_TX_COUNT_MASK            GENMASK(15, 8)
>> +#define ASPEED_I2CD_BUF_OFFSET_MASK            GENMASK(5, 0)
>> +
>>   enum aspeed_i2c_master_state {
>>       ASPEED_I2C_MASTER_INACTIVE,
>>       ASPEED_I2C_MASTER_PENDING,
>> @@ -157,6 +174,11 @@ struct aspeed_i2c_bus {
>>       int                master_xfer_result;
>>       /* Multi-master */
>>       bool                multi_master;
>> +    /* Buffer mode */
>> +    void __iomem            *buf_base;
>> +    size_t                buf_size;
>> +    u8                buf_offset;
>> +    u8                buf_page;
>>   #if IS_ENABLED(CONFIG_I2C_SLAVE)
>>       struct i2c_client        *slave;
>>       enum aspeed_i2c_slave_state    slave_state;
>> @@ -238,6 +260,7 @@ static u32 aspeed_i2c_slave_irq(struct 
>> aspeed_i2c_bus *bus, u32 irq_status)
>>   {
>>       u32 command, irq_handled = 0;
>>       struct i2c_client *slave = bus->slave;
>> +    int i, len;
>>       u8 value;
>>       if (!slave)
>> @@ -260,7 +283,12 @@ static u32 aspeed_i2c_slave_irq(struct 
>> aspeed_i2c_bus *bus, u32 irq_status)
>>       /* Slave was sent something. */
>>       if (irq_status & ASPEED_I2CD_INTR_RX_DONE) {
>> -        value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
>> +        if (bus->buf_base &&
>> +            bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
>> +            !(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))
>> +            value = readb(bus->buf_base);
>> +        else
>> +            value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
>>           /* Handle address frame. */
>>           if (bus->slave_state == ASPEED_I2C_SLAVE_START) {
>>               if (value & 0x1)
>> @@ -275,6 +303,20 @@ static u32 aspeed_i2c_slave_irq(struct 
>> aspeed_i2c_bus *bus, u32 irq_status)
>>       /* Slave was asked to stop. */
>>       if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
>> +        if (bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
>> +            irq_status & ASPEED_I2CD_INTR_RX_DONE) {
>> +            if (bus->buf_base) {
>> +                len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
>> +                        readl(bus->base +
>> +                              ASPEED_I2C_BUF_CTRL_REG));
>> +                for (i = 0; i < len; i++) {
>> +                    value = readb(bus->buf_base + i);
>> +                    i2c_slave_event(slave,
>> +                            I2C_SLAVE_WRITE_RECEIVED,
>> +                            &value);
>> +                }
>> +            }
>> +        }
>>           irq_handled |= ASPEED_I2CD_INTR_NORMAL_STOP;
>>           bus->slave_state = ASPEED_I2C_SLAVE_STOP;
>>       }
>> @@ -307,9 +349,36 @@ static u32 aspeed_i2c_slave_irq(struct 
>> aspeed_i2c_bus *bus, u32 irq_status)
>>       case ASPEED_I2C_SLAVE_WRITE_REQUESTED:
>>           bus->slave_state = ASPEED_I2C_SLAVE_WRITE_RECEIVED;
>>           i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
>> +        if (bus->buf_base) {
>> +            writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
>> +                      bus->buf_size - 1) |
>> +                   FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
>> +                      bus->buf_offset),
>> +                   bus->base + ASPEED_I2C_BUF_CTRL_REG);
>> +            writel(ASPEED_I2CD_RX_BUFF_ENABLE,
>> +                   bus->base + ASPEED_I2C_CMD_REG);
>> +        }
>>           break;
>>       case ASPEED_I2C_SLAVE_WRITE_RECEIVED:
>>           i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
>> +        if (bus->buf_base) {
>> +            len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
>> +                    readl(bus->base +
>> +                          ASPEED_I2C_BUF_CTRL_REG));
>> +            for (i = 1; i < len; i++) {
>> +                value = readb(bus->buf_base + i);
>> +                i2c_slave_event(slave,
>> +                        I2C_SLAVE_WRITE_RECEIVED,
>> +                        &value);
>> +            }
>> +            writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
>> +                      bus->buf_size - 1) |
>> +                   FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
>> +                      bus->buf_offset),
>> +                   bus->base + ASPEED_I2C_BUF_CTRL_REG);
>> +            writel(ASPEED_I2CD_RX_BUFF_ENABLE,
>> +                   bus->base + ASPEED_I2C_CMD_REG);
>> +        }
>>           break;
>>       case ASPEED_I2C_SLAVE_STOP:
>>           i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
>> @@ -335,6 +404,8 @@ static void aspeed_i2c_do_start(struct 
>> aspeed_i2c_bus *bus)
>>       u32 command = ASPEED_I2CD_M_START_CMD | ASPEED_I2CD_M_TX_CMD;
>>       struct i2c_msg *msg = &bus->msgs[bus->msgs_index];
>>       u8 slave_addr = i2c_8bit_addr_from_msg(msg);
>> +    u8 wbuf[4];
>> +    int len;
>>   #if IS_ENABLED(CONFIG_I2C_SLAVE)
>>       /*
>> @@ -353,12 +424,66 @@ static void aspeed_i2c_do_start(struct 
>> aspeed_i2c_bus *bus)
>>       if (msg->flags & I2C_M_RD) {
>>           command |= ASPEED_I2CD_M_RX_CMD;
>> -        /* Need to let the hardware know to NACK after RX. */
>> -        if (msg->len == 1 && !(msg->flags & I2C_M_RECV_LEN))
>> -            command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
>> +
>> +        if (bus->buf_base && !(msg->flags & I2C_M_RECV_LEN)) {
>> +            command |= ASPEED_I2CD_RX_BUFF_ENABLE;
>> +
>> +            if (msg->len > bus->buf_size) {
>> +                len = bus->buf_size;
>> +            } else {
>> +                len = msg->len;
>> +                command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
>> +            }
>> +
>> +            writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
>> +                      len - 1) |
>> +                   FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
>> +                      bus->buf_offset),
>> +                   bus->base + ASPEED_I2C_BUF_CTRL_REG);
>> +        } else {
>> +            /* Need to let the hardware know to NACK after RX. */
>> +            if (msg->len == 1 && !(msg->flags & I2C_M_RECV_LEN))
>> +                command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
>> +        }
>> +    } else {
>> +        if (bus->buf_base) {
>> +            int i;
>> +
>> +            command |= ASPEED_I2CD_TX_BUFF_ENABLE;
>> +
>> +            if (msg->len + 1 > bus->buf_size)
>> +                len = bus->buf_size;
>> +            else
>> +                len = msg->len + 1;

In case of one byte TX, len will be set 2 at here because the first byte
of the buffer is slave address.

>> +
>> +            /*
>> +             * Yeah, it looks clumsy but byte writings on a remapped
>> +             * I2C SRAM cause corruptions so use this way to make
>> +             * dword writings.
>> +             */
>> +            wbuf[0] = slave_addr;
>> +            for (i = 1; i < len; i++) {
>> +                wbuf[i % 4] = msg->buf[i - 1];
>> +                if (i % 4 == 3)
>> +                    writel(*(u32 *)wbuf,
>> +                           bus->buf_base + i - 3);
>> +            }
>> +            if (--i % 4 != 3)
>> +                writel(*(u32 *)wbuf,
>> +                       bus->buf_base + i - (i % 4));
>> +
>> +            bus->buf_index = len - 1;
> 
> 
> Is updating the buf_index here correct? You haven't actually sent any 
> data yet, only set the slave address and sent start. For a 1 byte tx, 
> buf_index == 1 now. Then, when the master irq is received and status is 
> ASPEED_I2C_MASTER_TX_FIRST, it fails the check for buf_index < msg->len 
> and therefore doesn't send tx command...
> 
> I could be misunderstanding what the hardware expects, but this behavior 
> is different than the non-buffered case. This is causing a problem in QEMU.

It's correct. In case of 1 byte TX, bus->buf_index is now 1 at here
(2 - 1). See below comment in the master irq.

> 
> Thanks,
> 
> Eddie
> 
>> +
>> +            writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
>> +                      len - 1) |
>> +                   FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
>> +                      bus->buf_offset),
>> +                   bus->base + ASPEED_I2C_BUF_CTRL_REG);
>> +        }
>>       }
>> -    writel(slave_addr, bus->base + ASPEED_I2C_BYTE_BUF_REG);
>> +    if (!(command & ASPEED_I2CD_TX_BUFF_ENABLE))
>> +        writel(slave_addr, bus->base + ASPEED_I2C_BYTE_BUF_REG);
>>       writel(command, bus->base + ASPEED_I2C_CMD_REG);
>>   }
>> @@ -398,7 +523,7 @@ static u32 aspeed_i2c_master_irq(struct 
>> aspeed_i2c_bus *bus, u32 irq_status)
>>       u32 irq_handled = 0, command = 0;
>>       struct i2c_msg *msg;
>>       u8 recv_byte;
>> -    int ret;
>> +    int ret, len;
>>       if (irq_status & ASPEED_I2CD_INTR_BUS_RECOVER_DONE) {
>>           bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
>> @@ -511,11 +636,43 @@ static u32 aspeed_i2c_master_irq(struct 
>> aspeed_i2c_bus *bus, u32 irq_status)
>>           /* fall through */
>>       case ASPEED_I2C_MASTER_TX_FIRST:
>>           if (bus->buf_index < msg->len) {

Below code is for sending for remaining data when msg->len is bigger
than the buffer size. In case of 1 byte TX, below code will be bypassed
because are bus->buf_index and msg->len are 1, and it will send a 'stop'
command below...

>> +            command = ASPEED_I2CD_M_TX_CMD;
>> +
>> +            if (bus->buf_base) {
>> +                u8 wbuf[4];
>> +                int i;
>> +
>> +                command |= ASPEED_I2CD_TX_BUFF_ENABLE;
>> +
>> +                if (msg->len - bus->buf_index > bus->buf_size)
>> +                    len = bus->buf_size;
>> +                else
>> +                    len = msg->len - bus->buf_index;
>> +
>> +                for (i = 0; i < len; i++) {
>> +                    wbuf[i % 4] = msg->buf[bus->buf_index
>> +                                   + i];
>> +                    if (i % 4 == 3)
>> +                        writel(*(u32 *)wbuf,
>> +                               bus->buf_base + i - 3);
>> +                }
>> +                if (--i % 4 != 3)
>> +                    writel(*(u32 *)wbuf,
>> +                           bus->buf_base + i - (i % 4));
>> +
>> +                bus->buf_index += len;
>> +
>> +                writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
>> +                          len - 1) |
>> +                       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
>> +                          bus->buf_offset),
>> +                       bus->base + ASPEED_I2C_BUF_CTRL_REG);
>> +            } else {
>> +                writel(msg->buf[bus->buf_index++],
>> +                       bus->base + ASPEED_I2C_BYTE_BUF_REG);
>> +            }
>> +            writel(command, bus->base + ASPEED_I2C_CMD_REG);
>>               bus->master_state = ASPEED_I2C_MASTER_TX;
>> -            writel(msg->buf[bus->buf_index++],
>> -                   bus->base + ASPEED_I2C_BYTE_BUF_REG);
>> -            writel(ASPEED_I2CD_M_TX_CMD,
>> -                   bus->base + ASPEED_I2C_CMD_REG);
>>           } else {
>>               aspeed_i2c_next_msg_or_stop(bus);

at here.

It works well in real hardware and I don't think it causes QEMU crash.
QEMU needs to emulate this buffer mode correctly to prevent the crash.

Thanks,
Jae

>>           }
>> @@ -532,25 +689,56 @@ static u32 aspeed_i2c_master_irq(struct 
>> aspeed_i2c_bus *bus, u32 irq_status)
>>           }
>>           irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
>> -        recv_byte = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
>> -        msg->buf[bus->buf_index++] = recv_byte;
>> -
>> -        if (msg->flags & I2C_M_RECV_LEN) {
>> -            if (unlikely(recv_byte > I2C_SMBUS_BLOCK_MAX)) {
>> -                bus->cmd_err = -EPROTO;
>> -                aspeed_i2c_do_stop(bus);
>> -                goto out_no_complete;
>> +        if (bus->buf_base && !(msg->flags & I2C_M_RECV_LEN)) {
>> +            len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
>> +                    readl(bus->base +
>> +                          ASPEED_I2C_BUF_CTRL_REG));
>> +            memcpy_fromio(msg->buf + bus->buf_index,
>> +                      bus->buf_base, len);
>> +            bus->buf_index += len;
>> +        } else {
>> +            recv_byte = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG)
>> +                    >> 8;
>> +            msg->buf[bus->buf_index++] = recv_byte;
>> +
>> +            if (msg->flags & I2C_M_RECV_LEN) {
>> +                if (unlikely(recv_byte > I2C_SMBUS_BLOCK_MAX)) {
>> +                    bus->cmd_err = -EPROTO;
>> +                    aspeed_i2c_do_stop(bus);
>> +                    goto out_no_complete;
>> +                }
>> +                msg->len = recv_byte +
>> +                        ((msg->flags & I2C_CLIENT_PEC) ?
>> +                        2 : 1);
>> +                msg->flags &= ~I2C_M_RECV_LEN;
>>               }
>> -            msg->len = recv_byte +
>> -                    ((msg->flags & I2C_CLIENT_PEC) ? 2 : 1);
>> -            msg->flags &= ~I2C_M_RECV_LEN;
>>           }
>>           if (bus->buf_index < msg->len) {
>> -            bus->master_state = ASPEED_I2C_MASTER_RX;
>>               command = ASPEED_I2CD_M_RX_CMD;
>> -            if (bus->buf_index + 1 == msg->len)
>> -                command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
>> +            bus->master_state = ASPEED_I2C_MASTER_RX;
>> +            if (bus->buf_base) {
>> +                command |= ASPEED_I2CD_RX_BUFF_ENABLE;
>> +
>> +                if (msg->len - bus->buf_index >
>> +                    bus->buf_size) {
>> +                    len = bus->buf_size;
>> +                } else {
>> +                    len = msg->len - bus->buf_index;
>> +                    command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
>> +                }
>> +
>> +                writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
>> +                          len - 1) |
>> +                       FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
>> +                          0) |
>> +                       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
>> +                          bus->buf_offset),
>> +                       bus->base + ASPEED_I2C_BUF_CTRL_REG);
>> +            } else {
>> +                if (bus->buf_index + 1 == msg->len)
>> +                    command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
>> +            }
>>               writel(command, bus->base + ASPEED_I2C_CMD_REG);
>>           } else {
>>               aspeed_i2c_next_msg_or_stop(bus);
>> @@ -890,6 +1078,9 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus 
>> *bus,
>>       if (ret < 0)
>>           return ret;
>> +    fun_ctrl_reg |= FIELD_PREP(ASPEED_I2CD_BUFFER_PAGE_SEL_MASK,
>> +                   bus->buf_page);
>> +
>>       if (of_property_read_bool(pdev->dev.of_node, "multi-master"))
>>           bus->multi_master = true;
>>       else
>> @@ -947,16 +1138,15 @@ static int aspeed_i2c_probe_bus(struct 
>> platform_device *pdev)
>>   {
>>       const struct of_device_id *match;
>>       struct aspeed_i2c_bus *bus;
>> +    bool sram_enabled = true;
>>       struct clk *parent_clk;
>> -    struct resource *res;
>>       int irq, ret;
>>       bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
>>       if (!bus)
>>           return -ENOMEM;
>> -    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -    bus->base = devm_ioremap_resource(&pdev->dev, res);
>> +    bus->base = devm_platform_ioremap_resource(pdev, 0);
>>       if (IS_ERR(bus->base))
>>           return PTR_ERR(bus->base);
>> @@ -990,6 +1180,42 @@ static int aspeed_i2c_probe_bus(struct 
>> platform_device *pdev)
>>           bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
>>                   match->data;
>> +    /* Enable I2C SRAM in case of AST2500 */
>> +    if (of_device_is_compatible(pdev->dev.of_node,
>> +                    "aspeed,ast2500-i2c-bus")) {
>> +        struct regmap *gr_regmap = syscon_regmap_lookup_by_compatible(
>> +            "aspeed,ast2500-i2c-gr");
>> +        if (IS_ERR(gr_regmap))
>> +            ret = PTR_ERR(gr_regmap);
>> +        else
>> +            ret = regmap_update_bits(gr_regmap,
>> +                         ASPEED_I2CG_GLOBAL_CTRL_REG,
>> +                         ASPEED_I2CG_SRAM_BUFFER_EN,
>> +                         ASPEED_I2CG_SRAM_BUFFER_EN);
>> +
>> +        if (ret)
>> +            sram_enabled = false;
>> +    }
>> +
>> +    if (sram_enabled) {
>> +        struct resource *res = platform_get_resource(pdev,
>> +                                 IORESOURCE_MEM, 1);
>> +
>> +        bus->buf_base = devm_ioremap_resource(&pdev->dev, res);
>> +        if (IS_ERR(bus->buf_base) || resource_size(res) < 2) {
>> +            bus->buf_base = NULL;
>> +        } else {
>> +            bus->buf_size = resource_size(res);
>> +            if (of_device_is_compatible(pdev->dev.of_node,
>> +                            "aspeed,ast2400-i2c-bus")) {
>> +                bus->buf_page = ((res->start >> 8) &
>> +                         GENMASK(3, 0)) - 8;
>> +                bus->buf_offset = (res->start >> 2) &
>> +                          ASPEED_I2CD_BUF_OFFSET_MASK;
>> +            }
>> +        }
>> +    }
>> +
>>       /* Initialize the I2C adapter */
>>       spin_lock_init(&bus->lock);
>>       init_completion(&bus->cmd_complete);
>> @@ -1026,8 +1252,8 @@ static int aspeed_i2c_probe_bus(struct 
>> platform_device *pdev)
>>       platform_set_drvdata(pdev, bus);
>> -    dev_info(bus->dev, "i2c bus %d registered, irq %d\n",
>> -         bus->adap.nr, irq);
>> +    dev_info(bus->dev, "i2c bus %d registered (%s mode), irq %d\n",
>> +         bus->adap.nr, bus->buf_base ? "buffer" : "byte", irq);
>>       return 0;
>>   }
